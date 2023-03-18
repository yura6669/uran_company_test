import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uran_company_test/services/exhibits_cache_service.dart';
import 'package:uran_company_test/services/exhibits_loader.dart';
import 'package:equatable/equatable.dart';
import 'package:uran_company_test/models/exhibit.dart';

part 'exhibit_state.dart';
part 'exhibit_event.dart';

class ExhibitBloc extends Bloc<ExhibitEvent, ExhibitState> {
  ExhibitBloc({
    required this.exhibitsLoader,
    required this.cache,
  }) : super(const _Loading()) {
    on<_Load>(_load);

    load();
  }

  final ExhibitsLoader exhibitsLoader;
  final ExhibitsCacheService cache;

  Future<void> _load(_Load event, Emitter<ExhibitState> emitter) async {
    emitter(const _Loading());

    try {
      final cached = await cache.all();
      if (cached.isNotEmpty) {
        emitter(_Ready(exhibits: cached));
      }

      final exhibits = await exhibitsLoader.getExhibitList();
      await cache.save(exhibits);

      emitter(_Ready(exhibits: exhibits));
    } catch (e) {
      final oldState = state;

      if (oldState.isReady) {
        if (oldState.asReady.exhibits.isNotEmpty) {
          return;
        }
      }

      bool hasNetworkError = e is TimeoutException || e is SocketException;

      emitter(
        _Error(
          error: e.toString(),
          hasNetworkError: hasNetworkError,
        ),
      );

      if (oldState.isReady) {
        emitter(oldState);
      }
    }
  }
}

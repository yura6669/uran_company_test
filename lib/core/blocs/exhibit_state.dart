// ignore_for_file: library_private_types_in_public_api

part of 'exhibit_bloc.dart';

extension ExhibitsStateX on ExhibitState {
  bool get isLoading => this is _Loading;

  bool get isReady => this is _Ready;

  bool get isError => this is _Error;

  _Loading get asLoading => this as _Loading;

  _Ready get asReady => this as _Ready;

  _Error get asError => this as _Error;
}

abstract class ExhibitState extends Equatable {
  const ExhibitState();

  @override
  List<Object?> get props => [];
}

class _Loading extends ExhibitState {
  const _Loading();
}

class _Ready extends ExhibitState {
  const _Ready({
    this.exhibits = const [],
  });

  final List<Exhibit> exhibits;

  @override
  List<Object?> get props => [exhibits];
}

class _Error extends ExhibitState {
  const _Error({
    this.error,
    this.hasNetworkError = false,
  });

  final String? error;
  final bool hasNetworkError;

  @override
  List<Object?> get props => [error, hasNetworkError];
}

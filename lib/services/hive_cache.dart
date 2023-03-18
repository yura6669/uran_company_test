import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

abstract class HiveCache<T extends Object?> {
  HiveCache();

  abstract final String name;
  Box<T>? _cache;

  FutureOr<Box<T>> cache() async {
    if (!(_cache?.isOpen ?? false)) {
      _cache = await _open();
    }

    return _cache!;
  }

  StreamSubscription<BoxEvent>? _listener;

  Future<Box<T>> _open() async {
    Box<T> box;
    var refreshListener = true;

    if (Hive.isBoxOpen(name)) {
      box = Hive.box<T>(name);
      refreshListener = false;
    } else {
      Hive.init((await getApplicationDocumentsDirectory()).path);
      box = await Hive.openBox<T>(name);
    }

    if (refreshListener) {
      await _listener?.cancel();

      _listener = box.watch().listen((event) {});
    }

    return box;
  }

  Future<void> dispose() async {
    await _listener?.cancel();
    final db = await cache();
    await db.compact();
    await db.close();
  }
}

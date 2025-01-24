import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum StorageKey {
  card,
}

class StorageManager extends GetxService {
  final GetStorage _box = GetStorage();

  String? read({required StorageKey key}) {
    return _box.read(key.name);
  }

  Future<void> write({required StorageKey key, required Map<String, Object?> data}) async {
    return await _box.write(key.name, jsonEncode(data));
  }

  Future<void> delete({required StorageKey key}) async {
    return await _box.remove(key.name);
  }

  Future<void> clear() async {
    return await _box.erase();
  }
}

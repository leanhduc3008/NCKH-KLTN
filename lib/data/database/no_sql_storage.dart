import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';

class NoSqlStorage {
  const NoSqlStorage._();

  static NoSqlStorage? _instance;

  static NoSqlStorage get instance => _instance ??= const NoSqlStorage._();

  static GetStorage? _storage;

  static FlutterSecureStorage? _secureStorage;

  static Future<NoSqlStorage> initialize() async {
    await GetStorage.init();

    _storage ??= GetStorage();
    _secureStorage ??= const FlutterSecureStorage();

    return instance;
  }

  /* ------------------ SECURE STORAGE ----------------------- */

  /// Reads the decrypted value for the key from secure storage
  Future<String?> getEncrypted(String key) {
    try {
      return _secureStorage!.read(key: key);
    } on PlatformException {
      return Future<String?>.value();
    }
  }

  /// Sets the encrypted value for the key to secure storage
  Future<bool> saveEncrypted(String key, String value) async {
    try {
      await _secureStorage!.write(key: key, value: value);
      return Future<bool>.value(true);
    } on PlatformException catch (_) {
      return Future<bool>.value(false);
    }
  }

  /// Erases encrypted keys
  Future<void> clearEncrypted() {
    return _secureStorage!.deleteAll();
  }

  /* ------------------ GET STORAGE ----------------------- */

  /// Return the value associated with the given [key]. If the key does not exist, `null` is returned.
  T? getItem<T>(String key) {
    try {
      return _storage!.read<T>(key);
    } catch (_) {
      return null;
    }
  }

  /// Returns list value associated with the given [key]. If the key does not exist, `null` is returned.
  List<T>? getItems<T>(String key) {
    try {
      final items = json.decode(_storage!.read<String>(key)!) as Iterable;
      return items.map((e) => e as T).toList();
    } catch (_) {
      return null;
    }
  }

  /// Set the value for the key to common get storage
  /// Can save String, int, double, Map
  Future<void> saveItem<T>(String key, T? value) {
    if (value != null) {
      return _storage!.write(key, value);
    } else {
      return _storage!.remove(key);
    }
  }

  /// Sets list value for the key to common get storage
  /// Can save List
  Future<void> saveItems<T>(String key, List<T>? items) {
    if (items != null) {
      return _storage!.write(key, json.encode(items));
    } else {
      return _storage!.remove(key);
    }
  }

  /// Listens the value for the key to common get storage
  VoidCallback listenItem(String key, ValueSetter value) {
    return _storage!.listenKey(key, value);
  }

  /// Erases get storage keys
  Future<void> clear() {
    return _storage!.erase();
  }
}

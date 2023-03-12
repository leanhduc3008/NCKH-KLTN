import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/collections.dart';
import '../../common/constants/theme.dart';
import '../database/no_sql_storage.dart';
import '../model/floor.dart';

abstract class AppProvider {
  List<Floor> get floors;
  ThemeMode get themeMode;
  Locale get locale;

  Future<void> changeThemeMode(ThemeMode value);
  Future<void> changeLocale(Locale value);
}

enum _AppKey {
  floor,
  themeMode,
  locale,
}

class AppProviderImpl extends GetxService implements AppProvider {
  StreamSubscription? _streamSubscription;
  final NoSqlStorage _storage = Get.find<NoSqlStorage>();
  final collection = FirebaseFirestore.instance.collection(Collections.floors);

  @override
  List<Floor> get floors {
    try {
      final jsons = _storage.getItems(_AppKey.floor.toString());
      final floors = jsons?.map((json) => Floor.fromJson(json)).toList() ?? [];
      floors.sort((a, b) => a.position > b.position ? 1 : 0);
      return floors;
    } catch (_) {
      return [];
    }
  }

  Future<void> saveFloors(Iterable<Floor> items) {
    return _storage.saveItems(
      _AppKey.floor.toString(),
      items.map((e) => e.toJson()).toList(),
    );
  }

  @override
  void onReady() {
    super.onReady();
    _streamSubscription = collection
        .withConverter<Floor>(
            fromFirestore: (snapshot, _) => Floor.fromJson(snapshot.data()!),
            toFirestore: (Floor floor, _) => floor.toJson())
        .snapshots()
        .listen((QuerySnapshot<Floor> event) => saveFloors(
              event.docs.map((e) => e.data().copyWith(id: e.id)),
            ));

    changeThemeMode(themeMode);
    changeLocale(locale);
  }

  @override
  void onClose() {
    _streamSubscription?.cancel();
    super.onClose();
  }

  @override
  ThemeMode get themeMode {
    final index = _storage.getItem<int>(_AppKey.themeMode.toString());

    return ThemeMode.values.elementAt(index ?? 0);
  }

  @override
  Locale get locale {
    final languageCode = _storage.getItem<String>(_AppKey.locale.toString());

    return Locale(languageCode ?? 'vi');
  }

  @override
  Future<void> changeThemeMode(ThemeMode value) async {
    await _storage.saveItem(_AppKey.themeMode.toString(), value.index);
    if (value == ThemeMode.dark) {
      Get.changeTheme(AppTheme.dark);
    } else {
      Get.changeTheme(AppTheme.light);
    }
  }

  @override
  Future<void> changeLocale(Locale value) async {
    await _storage.saveItem(_AppKey.locale.toString(), value.languageCode);

    Get.updateLocale(value);
  }
}

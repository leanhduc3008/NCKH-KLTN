import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import '../../common/constants/collections.dart';
import '../database/no_sql_storage.dart';
import '../model/user.dart';

abstract class AuthProvider {
  Future<User> login(String username, String password);
  Future<void> logout();

  User? get user;
  set user(User? value);
}

enum _AuthKey {
  user,
}

class AuthProviderImpl extends GetxService implements AuthProvider {
  AuthProviderImpl() : super();
  final NoSqlStorage _storage = Get.find<NoSqlStorage>();
  final collection = FirebaseFirestore.instance.collection(Collections.users);

  @override
  Future<User> login(String username, String password) async {
    final User user = User(
      username: username,
      fullName: username,
    );

    await saveUser(user);

    return user;
  }

  @override
  Future<void> logout() async {
    _storage.clearEncrypted();
    _storage.clear();
  }

  @override
  User? get user {
    try {
      final json = _storage.getItem(_AuthKey.user.toString());
      return User.fromJson(json!);
    } catch (_) {
      return null;
    }
  }

  @override
  set user(User? value) {
    if (value == null) {
      return;
    }
    saveUser(value);
  }

  Future<void> saveUser(User value) async {
    await _storage.saveItem(
      _AuthKey.user.toString(),
      value.toJson(),
    );
    // collection.doc(value.id).update(value.toJson());
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   if (user != null) {
  //     _streamSubscription = collection
  //         .withConverter<User>(
  //           fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
  //           toFirestore: (value, _) => value.toJson(),
  //         )
  //         .doc(user?.id)
  //         .snapshots()
  //         .listen((event) => saveUser(event.data()!));
  //   }
  // }

  // @override
  // void onClose() {
  //   _streamSubscription?.cancel();
  //   super.onClose();
  // }
}

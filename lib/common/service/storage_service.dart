import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning/common/entities/entities.dart';
import 'package:ulearning/common/values/constants.dart';

class StorageService {
  late final SharedPreferences _pref;
  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  bool getBool(String key) {
    return _pref.getBool(key) ?? false;
  }

  bool isLoggedIn() {
    return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  Future<bool> remove(String key) {
    return _pref.remove(key);
  }

  UserItem getUserProfile() {
    var profileOffline =
        _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? "";
    if (profileOffline.isNotEmpty) {
      return UserItem.fromJson(jsonDecode(profileOffline));
    }
    return UserItem();
  }
}

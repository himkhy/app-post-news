/*
| ----------------------------------------------------------------------
| AppSharePreference
| ----------------------------------------------------------------------
| @ call instance
|
|
|
*/

// import 'package:shared_preferences/shared_preferences.dart';
//
// class AppSharePreference {
//   static SharedPreferences _preferences;
//
//   static SharedPreferences get instance {
//     if (_preferences == null) {
//       _preferences = SharedPreferences();
//     }
//     return _preferences;
//   }
// }


import 'dart:convert';

// import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
//
// class AppSharePreference {
//   static EncryptedSharedPreferences _preferences;
//
//   static EncryptedSharedPreferences get instance {
//     if (_preferences == null) {
//       _preferences = EncryptedSharedPreferences();
//     }
//     return _preferences;
//   }
// }

import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

class AppSharePreference {
  static Future<SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String getString(String key, [String defValue]) {
    return _prefsInstance.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs?.setString(key, value) ?? Future.value(false);
  }
}
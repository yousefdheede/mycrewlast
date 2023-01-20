import 'package:flutter/material.dart';
import 'package:my_crew/utils/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefs {
  SharedPrefs._();
  static SharedPrefs instance = SharedPrefs._();
  static SharedPreferences? _prefs;

  final String languageKey = 'language';
  final String firstOpenKey = 'first_open';
  final String userDataKey = 'user_data';
  final String themeDataKey = 'theme';
  final String isLoggedInKey = 'logged_in';

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  setLanguage({required String langCode}) async {
    try {
      await _prefs?.setString(languageKey, langCode);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  String getLanguage() {
    return _prefs?.getString(languageKey) ?? Constants.enLangCode;
  }


  void setIsFirsOpen() async {
    try {
      await _prefs?.setBool(firstOpenKey, true);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  bool isLoggedIn() {
    return _prefs?.getBool(isLoggedInKey) ?? false;
  }
  
  void setIsLoggedIn() async {
    try {
      await _prefs?.setBool(isLoggedInKey, true);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  bool isFirstOpen() {
    return _prefs?.getBool(firstOpenKey) ?? false;
  }


  void clearAllPrefs() async {
    await _prefs?.clear();
  }

  void clearValueWithKey({required String key}) async {
    await _prefs?.remove(key);
  }

  Future<void> setUserData({required String data}) async {
    await _prefs?.setString(userDataKey, data);
  }

  // get user data json decoded
  // UserModel? getUserData() {
  //   try{
  //   String userData = _prefs?.getString(userDataKey) ?? '';
  //   return UserModel.fromJson(jsonDecode(userData));
  //   }catch (e){
  //     Logger().e(e.toString());
  //   }
  // }

  Future<void> clearUserPrefs()async{
    await _prefs?.remove(userDataKey);
  }

   setTheme({required ThemeMode mode}) async {
    try {
      await _prefs?.setString(themeDataKey, mode.name);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  String getTheme() {
    return _prefs?.getString(themeDataKey) ?? ThemeMode.system.name;
  }
  
}

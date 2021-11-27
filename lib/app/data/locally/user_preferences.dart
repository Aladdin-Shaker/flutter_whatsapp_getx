import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whats_app_clone/app/models/user.dart';

class UserPreferences {
  // user data

  Future<bool> saveUser(User user) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    // debugPrint('USER_PREFERENCE => user to save ${convert.jsonEncode(user)}');
    try {
      removeUser();
      // must be converted to JSON
      _prefs.setString('user', convert.jsonEncode(user));

      return true;
    } catch (e) {
      debugPrint('USER_PREFERENCE => Error in saveUser localy => $e');
      return false;
    }
  }

  Future getUser() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? userPref;
    Map<String, dynamic>? userMap;

    // try {
    // must Deconverted from JSON
    userPref = _prefs.getString('user');
    debugPrint('USER_PREFERENCE => userPref 111=> $userPref');

    if (userPref != null) {
      userMap = convert.jsonDecode(userPref) as Map<String, dynamic>;
      debugPrint('USER_PREFERENCE => userMap 222=> $userMap');
    }

    if (userMap != null) {
      final User user = User.fromJson(userMap);
      debugPrint('USER_PREFERENCE => user 333=> ${convert.jsonEncode(user)}');
      return user;
    }
    return null;
    // } catch (e) {
    //   debugPrint('USER_PREFERENCE => Error in getUser localy => $e');
    //   throw ('USER_PREFERENCE => Error in getUser localy => $e');
    // }
  }

  Future removeUser() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    try {
      _prefs.remove('user');
    } catch (e) {
      debugPrint('USER_PREFERENCE => Error in removeUser localy => $e');
    }
  }

  // user token

  Future<bool> saveUserToken(String token) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    debugPrint('USER_PREFERENCE => token to save $token');

    try {
      removeUserToken();
      _prefs.setString('token', token);
      return true;
    } catch (e) {
      debugPrint('USER_PREFERENCE => Error in saveUserToken localy => $e');
      return false;
    }
  }

  Future getUserToken() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    try {
      final String? token = _prefs.getString('token');
      return token;
    } catch (e) {
      debugPrint('USER_PREFERENCE => Error in getUserToken localy => $e');
    }
  }

  Future removeUserToken() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    try {
      _prefs.remove('token');
    } catch (e) {
      debugPrint('USER_PREFERENCE => Error in removeUserToken localy => $e');
    }
  }
}

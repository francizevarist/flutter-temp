// ignore_for_file: non_constant_identifier_names
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager{

  static String KEY_USERNAME = 'username';
  static String KEY_USER_ID = 'user_id';
  static String KEY_USER_MOBILE_NUMBER = 'mobile_number';
  static String KEY_USER_FULL_NAME = 'user_full_name';
  static String KEY_FERRY_ID = 'ferry_id';

  //String
  //Saving a string
  static void saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  //Retrieving a string
  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  //Integer
  static void saveInteger(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  static Future<int?> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

}
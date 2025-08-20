import 'package:todo_flutter_training/models/enums/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const _currentLanguageKey = 'current_language';
  static const _deviceUDID = "device_udid";
  static const _accessToken = "access_token";

  static Future<Language?> getCurrentLanguage() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString(_currentLanguageKey) ?? "";
      return LanguageExt.languageFromCode(languageCode);
    } catch (e) {
      return null;
    }
  }

  static Future<void> setCurrentLanguage(Language language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currentLanguageKey, language.code);
  }

  static Future<void> saveDeviceUDID(String deviceId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_deviceUDID, deviceId);
  }

  static Future<String?> getDeviceUDID() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_deviceUDID);
  }

  static Future<void> saveAccessToken(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessToken, accessToken);
  }

  static Future<String?> getAccessToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_accessToken);
    } catch(e) {
      return null;
    }
  }

  static Future<void> clearAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessToken);
  }
}

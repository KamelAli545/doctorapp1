import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static const String _registrationKey = 'registration_token';

  Future<void> saveRegistrationToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_registrationKey, token);
  }

  Future<String?> getRegistrationToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_registrationKey);
  }

  Future<void> clearRegistrationToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_registrationKey);
  }
}
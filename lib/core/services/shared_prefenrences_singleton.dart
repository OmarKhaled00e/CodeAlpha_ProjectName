import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static final Prefs _instance = Prefs._internal();
  SharedPreferences? _prefs;

  static var instance;

  factory Prefs() {
    return _instance;
  }

  Prefs._internal();

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  SharedPreferences get prefs {
    if (_prefs == null) {
      throw Exception('SharedPreferences not initialized. Call init() first.');
    }
    return _prefs!;
  }

  // Example helper methods
  Future<bool> setString(String key, String value) async {
    return await prefs.setString(key, value);
  }

  String? getString(String key) {
    return prefs.getString(key);
  }

  bool? getBool(String key, [bool? bool]) {
    return prefs.getBool(key) ?? false;
  }
}

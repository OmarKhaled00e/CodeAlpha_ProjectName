import 'package:shared_preferences/shared_preferences.dart';



class Prefs {
  static final Prefs _instance = Prefs._internal();
  SharedPreferences? _prefs;

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

  static setBool(String key, bool bool) {
    return _instance.prefs.setBool(key, true);
  }

  static bool getBool(String key) {
    return _instance.prefs.getBool(key) ?? false;
  }
}

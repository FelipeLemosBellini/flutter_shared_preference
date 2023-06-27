import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  Future<SharedPreferences> sharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<dynamic> read(String key) async {
    var prefs = await sharedPreferences();
    return prefs.get(key) ?? "";
  }

  void write(String key, dynamic value) async {
    var prefs = await sharedPreferences();
    prefs.setString(key, value);
  }

  void cleanLocalData() async {
    var prefs = await sharedPreferences();
    prefs.clear();
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static addString(String key, String item) async {
    SharedPreferences _prefs;
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('key', item);
  }

  static removeItemInSharedPreference(String key) async {
    SharedPreferences _prefs;
    _prefs = await SharedPreferences.getInstance();
    _prefs.remove(key);
  }

  static getString(String key) async {
    SharedPreferences _prefs;
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getString('key');
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static const storageAccessToken = "STORAGE_CRYSTALSONBRISTOLS_ACCESS_TOKEN";

  static late StorageHelper mInstance;
  static late SharedPreferences _prefs;

  static Future<SharedPreferences> initializePreferences() async {
    mInstance = StorageHelper();
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  String get accessToken =>
      _prefs.getString(StorageHelper.storageAccessToken) ?? "";

  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String getString(String key) {
    return _prefs.getString(key) ?? "";
  }
}

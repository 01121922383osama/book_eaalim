import '../Values/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  late final SharedPreferences preferences;
  Future<StorageServices> init() async {
    preferences = await SharedPreferences.getInstance();
    return this;
  }

  /////////////////////////////////////////
  Future<bool> setBoolain(String key, bool value) async {
    return await preferences.setBool(key, value);
  }

  bool getBoolain() {
    return preferences.getBool(AppConstants.isChange) ?? false;
  }

  ///////////////////////////////////////////////
}

import 'core/CacheD/cache_helper.dart';
import 'package:flutter/cupertino.dart';

class Global {
  static late StorageServices storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    storageService = await StorageServices().init();
  }
}

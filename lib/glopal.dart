import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import 'core/CacheD/cache_helper.dart';

class Global {
  static late StorageServices storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    storageService = await StorageServices().init();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (Platform.isAndroid) {
        await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
      }
    });
  }
}

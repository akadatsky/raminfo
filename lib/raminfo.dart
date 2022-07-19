import 'dart:async';

import 'package:flutter/services.dart';

class RamInfo {
  static const MethodChannel _channel = MethodChannel('ua.work/raminfo');

  static Future<int> getRamUsageMb() async {
    try {
      final int result = await _channel.invokeMethod('getRamUsage');
      final resultMb = (result / 1024 / 1024).round();
      return resultMb;
    } on PlatformException {
      return 0;
    }
  }
}

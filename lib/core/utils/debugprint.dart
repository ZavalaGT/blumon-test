import 'package:flutter/foundation.dart';

abstract class DebPrint {
  static void log(Object? object) {
    if (kDebugMode) {
      print(object);
    }
  }
}

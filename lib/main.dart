import 'dart:async';
import 'dart:io';

import 'package:blumonpay_test/core/utils/debugprint.dart';
import 'package:blumonpay_test/core/utils/my_http_overrides.dart';
import 'package:blumonpay_test/src/presentation/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    app();
  }, (exception, stackTrace) async {
    DebPrint.log(exception);
  });
}

void app() async {
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  HttpOverrides.global = MyHttpOverrides();
  runApp(const AppState());
}

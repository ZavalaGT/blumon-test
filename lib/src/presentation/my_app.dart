import 'package:blumonpay_test/config/routes/app_router.dart';
import 'package:blumonpay_test/config/theme/app_theme.dart';
import 'package:blumonpay_test/src/presentation/services/notifications_service.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      title: 'Milusos Socios App',
      routerConfig: appRouter,
      scaffoldMessengerKey: NotificationService.messengerKey,
      theme: AppTheme().getTheme(),
      builder: (BuildContext context, Widget? child) {
        return child!;
      },
    );
  }
}

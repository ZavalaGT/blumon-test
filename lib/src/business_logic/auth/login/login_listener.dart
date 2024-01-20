import 'package:blumonpay_test/config/routes/app_router.dart';
import 'package:blumonpay_test/core/utils/debugprint.dart';
import 'package:blumonpay_test/src/business_logic/auth/login/login_state.dart';
import 'package:blumonpay_test/src/presentation/services/notifications_service.dart';
import 'package:flutter/material.dart';

abstract class LoginListener {
  static void listenLoginStatus(BuildContext context, LoginState state) async {
    DebPrint.log(state.status);
    if (state.status == LoginStatus.success) {
      DebPrint.log(state.token);
      DebPrint.log('To Home - GetMe Listener');
      appRouter.go('/auth/check');
    }
    if (state.status == LoginStatus.failure) {
      NotificationService.showSnackBar(message: state.errorMessage);
      if (state.errorMessage ==
          'Error en la red, verifique su conexión a Internet') {
        appRouter.push('/noWifi');
        return;
      }
      // Navigator.of(context).pushReplacementNamed('login');
    }
  }
}

import 'package:blumonpay_test/config/routes/app_router.dart';
import 'package:blumonpay_test/core/utils/debugprint.dart';
import 'package:blumonpay_test/src/business_logic/auth/getme/getme_cubit.dart';
import 'package:blumonpay_test/src/business_logic/auth/getme/getme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

abstract class GetmeListener {
  static void listenGetmeStatus(BuildContext context, GetmeState state) async {
    DebPrint.log(state.status);
    if (state.status == GetmeStatus.success) {
      DebPrint.log('Success - GetMe Listener');
    }
    if (state.status == GetmeStatus.get) {
      DebPrint.log('To Home - GetMe Listener');
      DebPrint.log(state.user.toJson().toString());
      appRouter.go('/home');
      context.read<GetmeCubit>().toSuccess();
    }
    if (state.status == GetmeStatus.noToken) {
      DebPrint.log('To SplashScreen - GetMe Listener');
      appRouter.go('/auth');
    }
    if (state.status == GetmeStatus.logout) {
      DebPrint.log('To Check - GetMe Listener');
      appRouter.go('/auth/check');
    }
    if (state.status == GetmeStatus.semiFail) {
      context.read<GetmeCubit>().getme();
    }
    if (state.status == GetmeStatus.failure) {
      DebPrint.log('To SplashScreen - GetMe Listener');
      appRouter.go('/auth');
    }
  }
}

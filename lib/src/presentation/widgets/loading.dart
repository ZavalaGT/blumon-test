import 'package:blumonpay_test/config/theme/project_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  final double? size;
  const LoadingWidget({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: color ?? ProjectColors.primarymain,
      size: size ?? 100.0,
    );
  }
}

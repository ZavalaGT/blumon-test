import 'package:blumonpay_test/config/theme/project_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: ProjectColors.secondarymain,
      scaffoldBackgroundColor: ProjectColors.backgroundColor,
      scrollbarTheme: const ScrollbarThemeData().copyWith(
        thumbColor: MaterialStateProperty.all(ProjectColors.primarydisable),
      ));
}

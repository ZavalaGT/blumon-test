import 'package:flutter/material.dart';
import 'package:blumonpay_test/config/theme/project_colors.dart';

class SubtitleStyle {
  static TextStyle primary(
      {double? fontSize, FontWeight? fontWeight, TextDecoration? underline}) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: fontSize ?? 36.0,
      fontWeight: fontWeight ?? FontWeight.normal,
      decoration: underline,
      color: ProjectColors.primarymain,
    );
  }

  static TextStyle secondary(
      {double? fontSize, FontWeight? fontWeight, TextDecoration? underline}) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: fontSize ?? 36.0,
      fontWeight: fontWeight ?? FontWeight.normal,
      decoration: underline,
      color: ProjectColors.secondarymain,
    );
  }

  static TextStyle tertiary(
      {double? fontSize, FontWeight? fontWeight, TextDecoration? underline}) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: fontSize ?? 36.0,
      fontWeight: fontWeight ?? FontWeight.normal,
      decoration: underline,
      color: ProjectColors.tertiarymain,
    );
  }

  static TextStyle white(
      {double? fontSize, FontWeight? fontWeight, TextDecoration? underline}) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: fontSize ?? 36.0,
      fontWeight: fontWeight ?? FontWeight.normal,
      decoration: underline,
      color: Colors.white,
    );
  }

  static TextStyle styled(
      {double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      TextDecoration? underline}) {
    return TextStyle(
        fontFamily: 'Roboto',
        fontSize: fontSize ?? 36.0,
        fontWeight: fontWeight ?? FontWeight.normal,
        decoration: underline,
        color: color ?? ProjectColors.graymain);
  }
}

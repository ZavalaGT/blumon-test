import 'package:blumonpay_test/config/theme/project_colors.dart';
import 'package:blumonpay_test/src/presentation/widgets/text_styled/text_styled.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool isloading;
  final bool? fullwidth;
  final bool? sametext;
  final Color? disabledColor;
  final Color? color;
  final GestureTapCallback? onPressed;
  final String text;

  const CustomButton({
    Key? key,
    required this.isloading,
    this.sametext,
    this.onPressed,
    this.fullwidth,
    this.color,
    this.disabledColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      key: key,
      minWidth: fullwidth ?? false ? double.infinity : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      disabledColor: disabledColor ?? ProjectColors.primarydisable,
      elevation: 5,
      color: color ?? ProjectColors.primarymain,
      onPressed: isloading ? null : onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          isloading
              ? sametext == null
                  ? 'Espere...'
                  : text
              : text,
          textAlign: TextAlign.center,
          style: Body1Style.white(),
        ),
      ),
    );
  }
}

class CustomButtonOutLine extends StatelessWidget {
  final bool isloading;
  final bool? fullwidth;
  final bool? sametext;
  final Color? disabledColor;
  final Color? color;
  final TextStyle? textStyle;
  final GestureTapCallback? onPressed;
  final String text;

  const CustomButtonOutLine({
    Key? key,
    required this.isloading,
    this.sametext,
    this.onPressed,
    this.fullwidth,
    this.color,
    this.disabledColor,
    this.textStyle,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      key: key,
      minWidth: fullwidth ?? false ? double.infinity : null,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: isloading
                  ? ProjectColors.graymain
                  : color ?? ProjectColors.primarymain,
              width: 2,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20)),
      disabledColor: disabledColor ?? ProjectColors.backgroundColor,
      elevation: 5,
      color: Colors.grey[200],
      onPressed: isloading ? null : onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          isloading
              ? sametext ?? false
                  ? text
                  : 'Espere...'
              : text,
          textAlign: TextAlign.center,
          style: isloading
              ? SubtitleStyle.styled(fontWeight: FontWeight.bold)
              : textStyle ?? SubtitleStyle.primary(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final bool isloading;
  final bool? sametext;
  final GestureTapCallback? onPressed;
  final String text;
  final bool? fullwidth;

  const PrimaryButton(
      {Key? key,
      required this.isloading,
      this.sametext,
      this.onPressed,
      this.fullwidth,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      key: key,
      isloading: isloading,
      text: text,
      onPressed: onPressed,
      sametext: sametext,
      fullwidth: fullwidth,
      color: ProjectColors.primarymain,
      disabledColor: ProjectColors.primarydisable,
    );
  }
}

class PrimaryOutlineButton extends StatelessWidget {
  final bool isloading;
  final bool? sametext;
  final GestureTapCallback? onPressed;
  final String text;
  final bool? fullwidth;

  const PrimaryOutlineButton(
      {Key? key,
      required this.isloading,
      this.sametext,
      this.onPressed,
      this.fullwidth,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButtonOutLine(
      key: key,
      isloading: isloading,
      text: text,
      onPressed: onPressed,
      sametext: sametext,
      fullwidth: fullwidth,
      color: ProjectColors.primarymain,
      disabledColor: ProjectColors.primarydisable,
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final bool isloading;
  final bool? sametext;
  final GestureTapCallback? onPressed;
  final String text;
  final bool? fullwidth;

  const SecondaryButton(
      {Key? key,
      required this.isloading,
      this.sametext,
      this.onPressed,
      this.fullwidth,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      key: key,
      isloading: isloading,
      text: text,
      onPressed: onPressed,
      sametext: sametext,
      fullwidth: fullwidth,
      color: ProjectColors.secondarymain,
      disabledColor: ProjectColors.secodarylight,
    );
  }
}

class SecondaryOutlineButton extends StatelessWidget {
  final bool isloading;
  final bool? sametext;
  final GestureTapCallback? onPressed;
  final String text;
  final bool? fullwidth;

  const SecondaryOutlineButton(
      {Key? key,
      required this.isloading,
      this.sametext,
      this.onPressed,
      this.fullwidth,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButtonOutLine(
      key: key,
      isloading: isloading,
      text: text,
      onPressed: onPressed,
      sametext: sametext,
      fullwidth: fullwidth,
      color: ProjectColors.secondarymain,
      disabledColor: ProjectColors.secodarylight,
    );
  }
}

class StyledButton extends StatelessWidget {
  final bool isloading;
  final bool? sametext;
  final GestureTapCallback? onPressed;
  final String text;
  final bool? fullwidth;
  final Color? color;

  const StyledButton(
      {Key? key,
      required this.isloading,
      this.sametext,
      this.onPressed,
      this.fullwidth,
      this.color,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      key: key,
      isloading: isloading,
      text: text,
      onPressed: onPressed,
      sametext: sametext,
      fullwidth: fullwidth,
      color: color,
      disabledColor: ProjectColors.graymain,
    );
  }
}

class StyledOutlineButton extends StatelessWidget {
  final bool isloading;
  final bool? sametext;
  final GestureTapCallback? onPressed;
  final String text;
  final bool? fullwidth;
  final Color? color;
  final bool? withIcon;

  const StyledOutlineButton(
      {Key? key,
      required this.isloading,
      this.sametext,
      this.onPressed,
      this.fullwidth,
      this.color,
      this.withIcon,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButtonOutLine(
      key: key,
      isloading: isloading,
      text: text,
      onPressed: onPressed,
      sametext: sametext,
      fullwidth: fullwidth,
      color: color,
      disabledColor: ProjectColors.graymain,
    );
  }
}

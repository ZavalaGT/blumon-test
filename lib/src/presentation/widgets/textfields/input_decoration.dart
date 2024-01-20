import 'package:blumonpay_test/config/theme/project_colors.dart';
import 'package:flutter/material.dart';
import '../text_styled/text_styled.dart';
import '../text_styled/body_1_text.dart';

abstract class InputDecorations {
  static InputDecoration textInput(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon,
      bool? hintShow}) {
    return InputDecoration(
      label: Text(labelText, style: Body1Style.styled()),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: ProjectColors.secodarylight),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: ProjectColors.secodarylight),
      ),
      focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: ProjectColors.primarymain, width: 2)),
      errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: Colors.red, width: 2)),
      hintText: hintText,
      floatingLabelBehavior:
          hintShow != null ? FloatingLabelBehavior.always : null,
      hintStyle: const TextStyle(color: Color.fromARGB(255, 196, 193, 193)),
      prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
      labelStyle: const TextStyle(color: Colors.grey),
    );
  }

  static InputDecoration passwordInput(
      {required String hintText,
      required String labelText,
      required bool visible,
      required void Function() pressed,
      IconData? prefixIcon,
      bool? hintShow}) {
    return InputDecoration(
      label: Text(labelText, style: Body1Style.styled()),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: ProjectColors.secodarylight),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: ProjectColors.secodarylight),
      ),
      focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: ProjectColors.primarymain, width: 2)),
      errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: Colors.red, width: 2)),
      hintText: hintText,
      floatingLabelBehavior:
          hintShow != null ? FloatingLabelBehavior.always : null,
      hintStyle: const TextStyle(color: Color.fromARGB(255, 196, 193, 193)),
      prefixIcon: Icon(prefixIcon),
      labelStyle: const TextStyle(color: Colors.grey),
      suffixIconColor: ProjectColors.neutralmain,
      suffixIcon: IconButton(
          onPressed: pressed,
          icon: Icon(visible ? Icons.visibility : Icons.visibility_off)),
    );
  }

  static InputDecoration searchInpunt({
    required String hintText,
    required String labelText,
    required void Function() pressed,
    Color? color,
    IconData? prefixIcon,
    bool? hintShow,
  }) {
    return InputDecoration(
      suffixIcon: IconButton(
        onPressed: pressed,
        icon: const Icon(Icons.search),
      ),
      label: Text(labelText, style: Body1Style.styled()),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: color ?? ProjectColors.secodarylight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: color ?? ProjectColors.secodarylight),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          borderSide:
              BorderSide(color: color ?? ProjectColors.primarymain, width: 2)),
      errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: Colors.red, width: 2)),
      hintText: hintText,
      floatingLabelBehavior:
          hintShow != null ? FloatingLabelBehavior.always : null,
      hintStyle: const TextStyle(color: Color.fromARGB(255, 196, 193, 193)),
      prefixIcon: Icon(prefixIcon),
      labelStyle: const TextStyle(color: Colors.grey),
    );
  }

  static InputDecoration commentInput(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon,
      bool? hintShow}) {
    return InputDecoration(
      hintMaxLines: 5,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: ProjectColors.secodarylight),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: ProjectColors.secodarylight),
      ),
      focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: ProjectColors.primarymain, width: 2)),
      errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: Colors.red, width: 2)),
      hintText: hintText,
      floatingLabelBehavior:
          hintShow != null ? FloatingLabelBehavior.always : null,
      hintStyle: const TextStyle(color: Color.fromARGB(255, 196, 193, 193)),
      prefixIcon: Icon(prefixIcon),
      labelStyle: const TextStyle(color: Colors.grey),
    );
  }

  static InputDecoration amountInput(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon,
      bool? hintShow}) {
    return InputDecoration(
      hintMaxLines: 5,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: ProjectColors.secodarylight),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: ProjectColors.secodarylight),
      ),
      focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: ProjectColors.primarymain, width: 2)),
      errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: Colors.red, width: 2)),
      hintText: hintText,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      floatingLabelBehavior:
          hintShow != null ? FloatingLabelBehavior.always : null,
      hintStyle: const TextStyle(color: Color.fromARGB(255, 196, 193, 193)),
      labelStyle: const TextStyle(color: Colors.grey),
    );
  }
}

import 'package:blumonpay_test/core/utils/utils.dart';
import 'package:blumonpay_test/src/presentation/widgets/textfields/input_decoration.dart';
import 'package:flutter/material.dart';

abstract class AppTextField {
  static TextFormField name({required Function(String?) onSavedText}) {
    return TextFormField(
      key: const ValueKey('Name_Input'),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecorations.textInput(
          hintText: 'socio@milusosapp.com',
          labelText: 'Nombre',
          prefixIcon: Icons.face),
      onSaved: onSavedText,
      validator: (value) => Validations.name(name: value?.trim() ?? ''),
    );
  }

  static TextFormField email({required Function(String?) onSavedText}) {
    return TextFormField(
      key: const ValueKey('Email_Input'),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecorations.textInput(
          hintText: 'socio@milusosapp.com',
          labelText: 'Correo',
          prefixIcon: Icons.email_outlined),
      onSaved: onSavedText,
      validator: (value) => Validations.email(email: value?.trim() ?? ''),
    );
  }

  static TextFormField password(
      {required bool visible,
      required Function() changeVisible,
      required Function(String?) onSavedText,
      required Function(String) onChangeText,
      int? len,
      Key? key}) {
    return TextFormField(
      key: key ?? const ValueKey('Password_Input'),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: false,
      obscureText: visible,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecorations.passwordInput(
          visible: visible,
          pressed: changeVisible,
          hintText: '********',
          labelText: 'Contraseña',
          prefixIcon: Icons.lock_outline),
      onSaved: onSavedText,
      onChanged: onChangeText,
      validator: (value) => Validations.password(
        password: value?.trim() ?? '',
      ),
    );
  }

  static TextFormField repPassword(
      {required bool visible,
      required Function() changeVisible,
      required String password,
      required Function(String?) onSavedText,
      required Function(String) onChangeText}) {
    return TextFormField(
      key: const ValueKey('Repeat_Password_Input'),
      autovalidateMode: password != ''
          ? AutovalidateMode.always
          : AutovalidateMode.onUserInteraction,
      autocorrect: false,
      obscureText: visible,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecorations.passwordInput(
          visible: visible,
          pressed: changeVisible,
          hintText: '********',
          labelText: 'Repite contraseña',
          prefixIcon: Icons.lock_outline),
      onSaved: onSavedText,
      onChanged: onChangeText,
      validator: (value) => Validations.passwordRep(
        password: password,
        passwordRep: value?.trim() ?? '',
      ),
    );
  }
}

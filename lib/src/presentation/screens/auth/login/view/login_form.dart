import 'package:blumonpay_test/config/theme/project_colors.dart';
import 'package:blumonpay_test/src/business_logic/blocs.dart';
import 'package:blumonpay_test/src/presentation/services/notifications_service.dart';
import 'package:blumonpay_test/src/presentation/widgets/custom_buttons.dart';
import 'package:blumonpay_test/src/presentation/widgets/spacings/spacing.dart';
import 'package:blumonpay_test/src/presentation/widgets/text_styled/text_styled.dart';
import 'package:blumonpay_test/src/presentation/widgets/textfields/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final Map<String, dynamic> _values = {
    'username': '',
    'password': '',
  };

  bool visibility = true;

  void _changeVisibility() {
    visibility = !visibility;
    setState(() {});
  }

  _login() {
    context.read<LoginCubit>().login(
          username: _values['username'],
          password: _values['password'],
        );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacing04(),
            Stack(
              children: [
                Center(
                    child: Text(
                  'Inicio de \nsesión',
                  textAlign: TextAlign.center,
                  style: TitleStyle.secondary(fontSize: 40),
                )),
              ],
            ),
            const Spacing04(),
            AppTextField.name(
                onSavedText: (value) =>
                    _values['username'] = value?.trim() ?? ''),
            const Spacing04(),
            AppTextField.password(
                visible: visibility,
                changeVisible: _changeVisibility,
                onChangeText: (value) => _values['password'] = value.trim(),
                onSavedText: (value) =>
                    _values['password'] = value?.trim() ?? ''),
            const Spacing04(),
            BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
              return PrimaryButton(
                key: const ValueKey('Login_Button'),
                fullwidth: true,
                text: 'Iniciar sesión',
                isloading: state.status == LoginStatus.loading,
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  _formkey.currentState!.save();
                  if (_formkey.currentState!.validate()) {
                    _login();
                  }
                },
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿No tienes cuenta?'),
                TextButton(
                  onPressed: () {
                    NotificationService.showSnackBar(
                        message: 'Sección no habilitada',
                        color: ProjectColors.secodarylight);
                  },
                  child: const Text('Crea una aquí'),
                )
              ],
            ),
            const Center(child: Text('¿Olvidaste tu contraseña?')),
            Center(
              child: TextButton(
                onPressed: () {
                  NotificationService.showSnackBar(
                      message: 'Sección no habilitada',
                      color: ProjectColors.secodarylight);
                },
                child: const Text('Recuperar aquí'),
              ),
            ),
            const Spacing02()
          ],
        ),
      ),
    );
  }
}

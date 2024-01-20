import 'package:blumonpay_test/config/theme/project_colors.dart';
import 'package:blumonpay_test/src/presentation/screens/auth/login/view/login_form.dart';
import 'package:blumonpay_test/src/presentation/widgets/background/geometrical_background.dart';
import 'package:blumonpay_test/src/presentation/widgets/spacings/spacing.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'login-screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      backgroundColor: ProjectColors.primarymain,
      body: _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: GeometricalBackground(
          bgColor: ProjectColors.primarymain,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // Icon Banner
                SizedBox(
                  width: size.width * .8,
                  height: 200,
                  child: Image.asset(
                    "assets/images/BlumonPayLogo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(
                      minHeight: size.height - 300,
                      maxHeight: size.height -
                          100), // 100 de los dos sizebox y 200 el ícono
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: scaffoldBackgroundColor,
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(100)),
                  ),
                  child: const LoginForm(),
                ),
                const Spacing04(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

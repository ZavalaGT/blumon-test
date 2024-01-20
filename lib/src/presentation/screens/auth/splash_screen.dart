import 'package:blumonpay_test/src/presentation/widgets/custom_buttons.dart';
import 'package:blumonpay_test/src/presentation/widgets/spacings/spacing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  static String name = 'splash-screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SplashOpctions()),
    );
  }
}

class SplashOpctions extends StatelessWidget {
  const SplashOpctions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Spacer(),
        SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          child: PrimaryButton(
            text: 'Iniciar sesión',
            isloading: false,
            onPressed: () {
              context.push('/auth/login');
            },
          ),
        ),
        const Spacing04(),
        SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          child: PrimaryOutlineButton(
            text: 'Regístrate ahora',
            isloading: false,
            onPressed: () {
              context.push('/auth/register');
            },
          ),
        ),
        Container(),
        const Spacer(),
      ],
    );
  }
}

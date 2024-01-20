import 'package:blumonpay_test/config/theme/project_colors.dart';
import 'package:blumonpay_test/src/presentation/widgets/custom_buttons.dart';
import 'package:blumonpay_test/src/presentation/widgets/spacings/spacing.dart';
import 'package:blumonpay_test/src/presentation/widgets/text_styled/text_styled.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoWifiScreen extends StatelessWidget {
  static String name = 'no-wifi-screen';
  const NoWifiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _NoWifiView(),
    );
  }
}

class _NoWifiView extends StatelessWidget {
  const _NoWifiView();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Container(),
                const Spacing04(),
                const Center(
                  child: Icon(
                    Icons.wifi_off_outlined,
                    color: ProjectColors.secondarydark,
                    size: 125,
                  ),
                ),
                const Spacing02(),
                Text(
                  'Hay un problema de conexion',
                  textAlign: TextAlign.center,
                  style: TitleStyle.secondary(),
                ),
                const Spacing02(),
                Text(
                  'Vuelve a intentarlo más tarde',
                  textAlign: TextAlign.center,
                  style: Body1Style.secondary(),
                ),
                const Spacing04(),
                PrimaryButton(
                  isloading: false,
                  text: 'Regresar',
                  onPressed: () {
                    try {
                      context.pop();
                    } catch (e) {
                      context.go('/home/0');
                    }
                  },
                ),
                const Spacing04()
              ],
            ),
          ),
        ),
      )
    ]);
  }
}

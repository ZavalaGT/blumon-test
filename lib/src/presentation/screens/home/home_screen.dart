import 'package:blumonpay_test/config/theme/project_colors.dart';
import 'package:blumonpay_test/src/business_logic/auth/getme/getme_cubit.dart';
import 'package:blumonpay_test/src/presentation/screens/home/views/products_view.dart';
import 'package:blumonpay_test/src/presentation/screens/home/views/profile_view.dart';
import 'package:blumonpay_test/src/presentation/widgets/text_styled/text_styled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors.backgroundColor,
        title: Text(
          'Prueba BlumonPay',
          style: Body1Style.secondary(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                context.read<GetmeCubit>().logout();
              },
              iconSize: 40,
              icon: Icon(Icons.logout))
        ],
      ),
      body: const SafeArea(
          child: Column(
        children: [
          ProfileView(),
          ProductsView(),
        ],
      )),
    );
  }
}

import 'package:blumonpay_test/src/business_logic/auth/getme/getme_cubit.dart';
import 'package:blumonpay_test/src/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCheckScreen extends StatelessWidget {
  static const name = 'auth-check-screen';
  const AuthCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CheckingAuthView());
  }
}

class CheckingAuthView extends StatefulWidget {
  const CheckingAuthView({super.key});

  @override
  State<CheckingAuthView> createState() => _CheckingAuthViewState();
}

class _CheckingAuthViewState extends State<CheckingAuthView> {
  @override
  void initState() {
    context.read<GetmeCubit>().getme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: LoadingWidget());
  }
}

import 'package:blumonpay_test/src/business_logic/blocs.dart';

import 'package:blumonpay_test/src/data/repositories/auth/auth_repositories.dart';
import 'package:blumonpay_test/src/data/repositories/products/products_reposotory.dart';
import 'package:blumonpay_test/src/domain/secure_storage/secure_storage_service_impl.dart';
import 'package:blumonpay_test/src/presentation/my_app.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppState extends StatefulWidget {
  const AppState({
    super.key,
  });

  @override
  State<AppState> createState() => _AppStateState();
}

class _AppStateState extends State<AppState> {
  final _getmeCubit = GetmeCubit(AuthRepository(), SecureStorageServiceImpl());
  final _loginCubit = LoginCubit(AuthRepository(), SecureStorageServiceImpl());
  final _productsCubit =
      ProductsCubit(ProductsRepository(), SecureStorageServiceImpl());

  @override
  void dispose() {
    _getmeCubit.close();
    _loginCubit.close();
    _productsCubit.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetmeCubit>.value(value: _getmeCubit),
        BlocProvider<LoginCubit>.value(value: _loginCubit),
        BlocProvider<ProductsCubit>.value(value: _productsCubit),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<GetmeCubit, GetmeState>(
            listener: (context, state) =>
                GetmeListener.listenGetmeStatus(context, state),
          ),
          BlocListener<LoginCubit, LoginState>(
            listener: (context, state) =>
                LoginListener.listenLoginStatus(context, state),
          ),
          BlocListener<ProductsCubit, ProductsState>(
            listener: (context, state) =>
                ProductsListener.listenProductsStatus(context, state),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

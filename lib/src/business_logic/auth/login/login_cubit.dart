import 'package:blumonpay_test/src/data/repositories/auth/auth_repositories.dart';
import 'package:blumonpay_test/src/domain/secure_storage/secure_storage_service_impl.dart';

import 'login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final SecureStorageServiceImpl _storage;
  final AuthRepository _repository;
  LoginCubit(this._repository, this._storage) : super(LoginState());

  Future<void> login(
      {required String username, required String password}) async {
    try {
      emit(state.copyWith(status: LoginStatus.loading));
      final user = await _repository.login(
        username: username,
        password: password,
      );
      await _storage.setKeyValue('token', user.token!);
      emit(state.copyWith(status: LoginStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}

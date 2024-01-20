import 'package:blumonpay_test/core/utils/debugprint.dart';
import 'package:blumonpay_test/src/data/repositories/auth/auth_repositories.dart';
import 'package:blumonpay_test/src/domain/secure_storage/secure_storage_service_impl.dart';

import './getme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetmeCubit extends Cubit<GetmeState> {
  final SecureStorageServiceImpl _storage;
  final AuthRepository _repository;
  int _getmeTry = 0;
  GetmeCubit(this._repository, this._storage) : super(GetmeState());

  Future<void> toSuccess() async {
    emit(state.copyWith(status: GetmeStatus.success));
  }

  Future<void> getme() async {
    try {
      emit(state.copyWith(status: GetmeStatus.loading));
      final token = await _storage.getValue('token');
      if (token == null || token == '') {
        DebPrint.log('No Token - Get Me Cubit');
        return emit(state.copyWith(status: GetmeStatus.noToken));
      }
      final user = await _repository.getMe(token: token);
      DebPrint.log('GetMe');
      _getmeTry = 0;
      emit(state.copyWith(
        user: user,
        status: GetmeStatus.get,
      ));
    } catch (e) {
      _getmeTry++;
      if (_getmeTry >= 3) {
        await _storage.removeKey('token');
        emit(state.copyWith(
          status: GetmeStatus.failure,
          errorMessage: e.toString(),
        ));
        return;
      }
      emit(state.copyWith(
        status: GetmeStatus.semiFail,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> logout() async {
    try {
      final token = await _storage.getValue('token');
      if (token == null || token == '') {
        return emit(state.copyWith(status: GetmeStatus.noToken));
      }
      await _storage.removeKey('token');
      emit(state.copyWith(status: GetmeStatus.logout));
    } catch (e) {
      emit(state.copyWith(
        status: GetmeStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}

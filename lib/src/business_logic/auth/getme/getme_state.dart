import 'package:blumonpay_test/src/data/models/user_model.dart';

enum GetmeStatus {
  initial,
  loading,
  get,
  success,
  noToken,
  logout,
  semiFail,
  failure,
}

class GetmeState {
  GetmeState({
    this.status = GetmeStatus.initial,
    this.errorMessage = '',
    this.token = '',
    UserModel? user,
  }) : user = user ?? UserModel.fromJson({});

  final GetmeStatus status;
  final String errorMessage;
  final String token;
  final UserModel user;

  GetmeState copyWith({
    GetmeStatus? status,
    String? errorMessage,
    String? token,
    UserModel? user,
  }) {
    return GetmeState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }
}

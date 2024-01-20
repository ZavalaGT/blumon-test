import 'package:blumonpay_test/core/errors/errors.dart';
import 'package:blumonpay_test/src/data/dataproviders/auth_api.dart';
import 'package:blumonpay_test/src/data/models/user_model.dart';

class AuthRepository {
  final AuthApi api = AuthApi();

  Future<UserModel> login(
      {required String username, required String password}) async {
    try {
      final Map<String, dynamic> authData = {
        "username": username,
        "password": password,
      };
      final response = await api.login(authData: authData);
      if (!response.containsKey('token')) {
        throw LoginException();
      }
      final user = UserModel.fromJson(response);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getMe({required String token}) async {
    try {
      final response = await api.getMe(token: token);
      if (!response.containsKey('id')) {
        throw GetMeException();
      }
      final user = UserModel.fromJson(response);
      return user;
    } catch (e) {
      rethrow;
    }
  }
}

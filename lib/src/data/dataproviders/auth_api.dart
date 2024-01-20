import 'package:blumonpay_test/core/helpers/apicalls.dart';

class AuthApi {
  Future<Map<String, dynamic>> login(
      {required Map<String, dynamic> authData}) async {
    const uri = "https://dummyjson.com/auth/login";
    final response = await ApiCalls.post(apiUrl: uri, bodyData: authData);
    return response;
  }

  Future<Map<String, dynamic>> getMe({required String token}) async {
    const uri = "https://dummyjson.com/auth/me";
    final response = await ApiCalls.getProtected(apiUrl: uri, token: token);
    return response;
  }
}

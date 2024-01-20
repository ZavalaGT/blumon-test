import 'package:blumonpay_test/core/helpers/apicalls.dart';

class ProductsApi {
  Future<Map<String, dynamic>> getProducts({required String token}) async {
    const uri = "https://dummyjson.com/auth/products";
    final response = await ApiCalls.getProtected(apiUrl: uri, token: token);
    return response;
  }
}

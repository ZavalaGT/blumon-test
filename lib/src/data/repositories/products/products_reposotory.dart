import 'package:blumonpay_test/core/errors/errors.dart';
import 'package:blumonpay_test/src/data/dataproviders/products_api.dart';
import 'package:blumonpay_test/src/data/models/products_model.dart';

class ProductsRepository {
  final ProductsApi api = ProductsApi();

  Future<ProductsModel> getProducts({required String token}) async {
    try {
      final response = await api.getProducts(token: token);
      if (!response.containsKey('products')) {
        throw GetMeException();
      }
      final products = ProductsModel.fromJson(response);
      return products;
    } catch (e) {
      rethrow;
    }
  }
}

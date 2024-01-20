import 'package:blumonpay_test/src/data/models/products_model.dart';

enum ProductsStatus {
  initial,
  loading,
  success,
  noToken,
  failure,
}

class ProductsState {
  ProductsState({
    this.status = ProductsStatus.initial,
    this.errorMessage = '',
    ProductsModel? products,
  }) : products = products ?? ProductsModel.fromJson({});

  final ProductsStatus status;
  final String errorMessage;
  final ProductsModel products;

  ProductsState copyWith({
    ProductsStatus? status,
    String? errorMessage,
    String? token,
    ProductsModel? products,
  }) {
    return ProductsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      products: products ?? this.products,
    );
  }
}

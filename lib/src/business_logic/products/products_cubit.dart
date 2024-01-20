import 'package:blumonpay_test/core/utils/debugprint.dart';
import 'package:blumonpay_test/src/data/repositories/products/products_reposotory.dart';
import 'package:blumonpay_test/src/domain/secure_storage/secure_storage_service_impl.dart';

import 'products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final SecureStorageServiceImpl _storage;
  final ProductsRepository _repository;
  ProductsCubit(this._repository, this._storage) : super(ProductsState());

  Future<void> getProducts() async {
    try {
      emit(state.copyWith(status: ProductsStatus.loading));
      final token = await _storage.getValue('token');
      if (token == null || token == '') {
        DebPrint.log('No Token - Products Cubit');
        return emit(state.copyWith(status: ProductsStatus.noToken));
      }
      final products = await _repository.getProducts(token: token);
      DebPrint.log('Products');
      emit(state.copyWith(
        products: products,
        status: ProductsStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProductsStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}

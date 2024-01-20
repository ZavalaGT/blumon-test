import 'package:blumonpay_test/core/utils/debugprint.dart';
import 'package:blumonpay_test/src/business_logic/products/products_state.dart';

import 'package:flutter/material.dart';

abstract class ProductsListener {
  static void listenProductsStatus(
      BuildContext context, ProductsState state) async {
    DebPrint.log(state.status);
    if (state.status == ProductsStatus.success) {
      DebPrint.log('Success - Products Listener');
    }

    if (state.status == ProductsStatus.noToken) {
      DebPrint.log('No Token - Products Listener');
    }

    if (state.status == ProductsStatus.failure) {
      DebPrint.log('Failure - Products Listener');
    }
  }
}

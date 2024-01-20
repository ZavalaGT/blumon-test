import 'package:blumonpay_test/config/theme/project_colors.dart';
import 'package:blumonpay_test/src/data/models/products_model.dart';
import 'package:blumonpay_test/src/presentation/widgets/text_styled/text_styled.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: ProjectColors.graylight),
          borderRadius: BorderRadius.circular(15)),
      width: 250,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 150,
              child: Image.network(
                product.images?[0].toString() ?? '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/imagenofound.png',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Text(
              product.title ?? '',
              style: Body2Style.secondary(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Stock ${product.stock.toString()}',
                  style: Body2Style.secondary(),
                ),
                Text(
                  '\$ ${product.price.toString()}',
                  style: Body2Style.secondary(),
                ),
              ],
            ),
            Text(product.description ?? ''),
          ],
        ),
      ),
    );
  }
}

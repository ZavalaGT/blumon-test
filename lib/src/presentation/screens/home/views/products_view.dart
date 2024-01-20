import 'package:blumonpay_test/config/theme/project_colors.dart';
import 'package:blumonpay_test/src/business_logic/blocs.dart';
import 'package:blumonpay_test/src/presentation/screens/home/views/products/product_item.dart';
import 'package:blumonpay_test/src/presentation/widgets/loading.dart';
import 'package:blumonpay_test/src/presentation/widgets/spacings/spacing.dart';
import 'package:blumonpay_test/src/presentation/widgets/text_styled/text_styled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Text(
          'Productos',
          style: TitleStyle.secondary(),
        ),
        const Spacing02(),
        BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
          if (state.status == ProductsStatus.loading) {
            return const LoadingWidget(
              color: ProjectColors.secondarydark,
            );
          }
          if (state.status == ProductsStatus.failure) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Error al obtener products',
                  style: Body1Style.secondary(),
                ),
              ],
            );
          }
          if (state.status == ProductsStatus.success) {
            final products = state.products.products;
            return SingleChildScrollView(
              child: SizedBox(
                height: 350,
                child: ListView.separated(
                  separatorBuilder: (context, i) => const SizedBox(
                    width: 20,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, i) =>
                      ProductItem(product: products[i]),
                ),
              ),
            );
          }
          return Container();
        })
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/models/product.dart';

import '../adapter/product_card_adapter.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return ProdcutGridViewItem(product: products[index]);
        },
        childCount: products.length,
      ),
    );
  }
}

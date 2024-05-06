import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/models/product.dart';

import '../adapter/product_card_adapter.dart';

class StoreSliverGridView extends StatelessWidget {
  const StoreSliverGridView({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProdcutGridViewItem(product: products[index]);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
      ),
    );
  }
}

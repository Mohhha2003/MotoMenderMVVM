import 'package:flutter/material.dart';

import '../adapter/product_card_adapter.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(left: 24, right: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20, crossAxisSpacing: 20, crossAxisCount: 2),
        itemBuilder: (context, index) {
          return const ProdcutGridViewItem();
        },
      ),
    ));
  }
}

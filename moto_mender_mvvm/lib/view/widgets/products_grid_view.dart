import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/models/product_request_model/product.dart';

import '../adapter/product_card_adapter.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(left: 24, right: 20, bottom: 10),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20, crossAxisSpacing: 20, crossAxisCount: 2),
        itemBuilder: (context, index) {
          print(products[index].imagePath);
          return ProdcutGridViewItem(product: products[index]);
        },
      ),
    ));
  }
}

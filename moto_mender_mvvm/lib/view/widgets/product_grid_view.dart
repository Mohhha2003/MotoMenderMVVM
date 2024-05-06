import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/view/adapter/product_card_adapter.dart';

class ProdcutsGridView extends StatelessWidget {
  const ProdcutsGridView({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProdcutGridViewItem(product: products[index]);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        crossAxisCount: 2,
      ),
    );
  }
}

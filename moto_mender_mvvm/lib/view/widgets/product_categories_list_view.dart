import 'package:flutter/material.dart';

import 'store_categorie_button.dart';

class ProductCategoriesListView extends StatelessWidget {
  const ProductCategoriesListView({
    super.key,
    required this.categories,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            categories.length,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: StoreCategorieButton(text: categories[index]),
                )),
      ),
    );
  }
}

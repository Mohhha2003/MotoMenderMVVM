import 'package:flutter/material.dart';

import 'store_categorie_button.dart';

class CategorieListView extends StatelessWidget {
  const CategorieListView({
    super.key,
    required this.categories,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      height: 30,
      child: ListView.builder(
        itemCount: categories.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: StoreCategorieButton(
              text: categories[index],
            ),
          );
        },
      ),
    );
  }
}

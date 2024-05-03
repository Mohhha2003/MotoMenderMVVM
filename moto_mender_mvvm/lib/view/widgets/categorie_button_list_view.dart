import 'package:flutter/material.dart';

import 'store_categorie_button.dart';

class CategorieButtonsListView extends StatelessWidget {
  const CategorieButtonsListView({
    super.key,
    required this.categories,
  });
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
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

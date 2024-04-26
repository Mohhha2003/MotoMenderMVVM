import 'package:flutter/material.dart';

import 'store_categorie_button.dart';

class CategorieButtonsListView extends StatelessWidget {
  const CategorieButtonsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: StoreCategorieButton(),
          );
        },
      ),
    );
  }
}

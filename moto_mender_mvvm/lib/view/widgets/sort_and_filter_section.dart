

import 'package:flutter/material.dart';

import 'categorie_list_view.dart';

class SortAndFliterSection extends StatelessWidget {
  const SortAndFliterSection(
      {super.key,
      required this.title,
      required this.categories,
      this.onPressed});

  final String title;
  final List<String> categories;
  final void Function(String)? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          CategorieListView(
            categories: categories,
              onPressed: onPressed ?? (p0) {},
          ),
        ],
      ),
    );
  }
}

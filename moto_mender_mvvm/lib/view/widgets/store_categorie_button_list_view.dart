import 'package:flutter/material.dart';
import 'categorie_list_view.dart';

class StoreCategorieListView extends StatelessWidget {
  const StoreCategorieListView({
    super.key,
    required this.categories,
  });
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CategorieListView(categories: categories),
    );
  }
}

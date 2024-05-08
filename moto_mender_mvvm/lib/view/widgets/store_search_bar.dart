import 'package:flutter/material.dart';
import 'custom_search_bar.dart';

class StoreSearchBar extends StatelessWidget {
  const StoreSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: CustomSearchBar(),
    );
  }
}

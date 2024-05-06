import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_search_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Column(
        children: [CustomSearchBar()],
      ),
    ));
  }
}

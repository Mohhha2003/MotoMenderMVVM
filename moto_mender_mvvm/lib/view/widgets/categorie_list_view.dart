import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/view_models/search/cubit/search_cubit.dart';
import 'store_categorie_button.dart';

class CategorieListView extends StatelessWidget {
  const CategorieListView({
    super.key,
    required this.categories,
    this.onPressed,
  });

  final List<String> categories;
  final void Function(String)? onPressed;

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
              onPressed: onPressed ?? (text) {},
              text: categories[index],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moto_mender_mvvm/view/widgets/categorie_list_view.dart';

void showSortAndFilterBottomSheet(
    BuildContext context, GlobalKey<ScaffoldState> scaffoldstate) {
  scaffoldstate.currentState!.showBottomSheet(
    (context) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.greenAccent, borderRadius: BorderRadius.circular(30)),
        height: MediaQuery.of(context).size.height * .6,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Sort&Filter',
              ),
            ),
            SortAndFliterSection(
              title: 'Categories',
              categories: ["price", "ratingAverage"],
            ),
            SortAndFliterSection(
                title: 'Type', categories: ["Asending", "Dsending"]),
          ],
        ),
      );
    },
  );
}

class SortAndFliterSection extends StatelessWidget {
  const SortAndFliterSection(
      {super.key, required this.title, required this.categories});

  final String title;
  final List<String> categories;

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
          CategorieListView(categories: categories),
        ],
      ),
    );
  }
}

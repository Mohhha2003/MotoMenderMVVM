import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../widgets/categorie_button_list_view.dart';
import '../widgets/products_grid_view.dart';
import '../widgets/sotre_app_bar.dart';
import '../widgets/view_all_categories_row.dart';
import '../widgets/store_image_slider_item.dart';
import '../widgets/store_search_bar.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            BottomNavigationBar(showUnselectedLabels: true, items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Likes'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ]),
        body: const Column(
          children: [
            StoreAppBar(),
            Gap(10),
            StoreSearchBar(),
            Gap(25),
            StoreImageSliderItem(),
            Gap(15),
            ViewAllCategoriesRow(),
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: CategorieButtonsListView(),
            ),
            Gap(30),
            ProductsGridView(),
          ],
        ));
  }
}

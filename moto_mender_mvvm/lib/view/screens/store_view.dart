import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/models/product_request_model/product_request_model.dart';

import '../widgets/categorie_button_list_view.dart';
import '../widgets/products_grid_view.dart';
import '../widgets/sotre_app_bar.dart';
import '../widgets/view_all_categories_row.dart';
import '../widgets/store_image_slider_item.dart';
import '../widgets/store_search_bar.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key, required this.products});

  final ProductRequestModel products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const StoreAppBar(),
        const Gap(10),
        const StoreSearchBar(),
        const Gap(25),
        const StoreImageSliderItem(),
        const Gap(15),
        const ViewAllCategoriesRow(),
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: CategorieButtonsListView(
            categories: ['Cleaning', 'Internal', 'External'],
          ),
        ),
        const Gap(30),
        ProductsGridView(
          products: products!.data!.products!,
        ),
      ],
    ));
  }
}

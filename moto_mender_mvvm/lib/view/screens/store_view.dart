import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/models/product_request_model/product_request_model.dart';
import 'package:moto_mender_mvvm/view/widgets/view_cart_button.dart';

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
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.transparent,
            pinned: true,
            title: Text('MotoMender'),
            actions: [CartViewButton()],
          ),
          const SliverGap(10),
          const StoreSearchBar(),
          const SliverGap(30),
          const StoreImageSliderItem(),
          const ViewAllCategoriesRow(),
          const CategorieButtonsListView(
            categories: ['Cleaning', 'Internal', 'External'],
          ),
          const SliverGap(20),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: ProductsGridView(
              products: products.data!.products!,
            ),
          )
        ],
      ),
    ));
  }
}

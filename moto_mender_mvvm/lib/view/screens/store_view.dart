import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/view/widgets/view_cart_button.dart';
import '../widgets/store_categorie_button_list_view.dart';
import '../widgets/store_products_sliver_grid_view.dart';
import '../widgets/view_all_categories_row.dart';
import '../widgets/store_image_slider_item.dart';
import '../widgets/store_search_bar.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key, required this.products});

  final List<Product> products;

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
          const StoreCategorieListView(
            categories: ['Cleaning', 'Internal', 'External'],
          ),
          const SliverGap(5),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: StoreSliverGridView(
              products: products,
            ),
          )
        ],
      ),
    ));
  }
}

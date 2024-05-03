import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/models/product_request_model/product.dart';
import 'package:moto_mender_mvvm/view/widgets/categorie_button_list_view.dart';
import '../widgets/prodcut_favourties_button.dart';
import '../widgets/product_back_button.dart';
import '../widgets/product_bottom_nav_bar.dart';
import '../widgets/ratting_prodcut_row.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ProductBottomNavBar(
        product: product,
      ),
      backgroundColor: const Color(0xffDFDEDE),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xffDFDEDE),
            automaticallyImplyLeading: false,
            actions: const [
              Gap(22),
              ProductBackButton(),
              Spacer(),
              ProductFavouritesButton(),
              Gap(22)
            ],
            expandedHeight: 390,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 88, vertical: 70),
                child: Image.network(
                  '${product.imagePath}',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              padding: const EdgeInsets.only(left: 21.5, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product.name}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Gap(10),
                  RattingReviewsProdcutRow(product: product),
                  const Gap(20),
                  Text(
                    '${product.description}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Gap(20),
                  CategorieButtonsListView(
                    categories: List.filled(2, '${product.category}'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/view/widgets/categorie_button_list_view.dart';
import '../widgets/prodcut_favourties_button.dart';
import '../widgets/product_back_button.dart';
import '../widgets/product_bottom_nav_bar.dart';
import '../widgets/ratting_prodcut_row.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ProductBottomNavBar(),
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
                child: Image.asset(
                  'assets/image/product.png',
                  fit: BoxFit.cover,
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
                    'MicroFiber Cleaning',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Gap(10),
                  const RattingReviewsProdcutRow(),
                  const Gap(20),
                  Text(
                    'Microfiber Cleaning Cloth Grey - 12 Packs 12.5"x12.5" High Performance - 1200 Washes, Ultra Absorbent Towels Weave Grime & Liquid for Streak - Free Mirror Shine -Car Washing Cloth',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Gap(20),
                  const CategorieButtonsListView()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

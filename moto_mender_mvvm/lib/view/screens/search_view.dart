import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/cubits/store_cubit/store_cubit.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/view/adapter/product_card_adapter.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_search_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search',
          style: style.titleLarge,
        ),
      ),
      body: Column(
        children: [
          const CustomSearchBar(),
          const Gap(20),
          Expanded(
              child: ProdcutsGridView(
                  products: context.read<StoreCubit>().products))
        ],
      ),
    ));
  }
}

class ProdcutsGridView extends StatelessWidget {
  const ProdcutsGridView({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProdcutGridViewItem(product: products[index]);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/cubits/store_cubit/store_cubit.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/view/adapter/favorite_product_adapter.dart';
import 'package:moto_mender_mvvm/view/widgets/empty_widgets.dart';

class SearchDelegeateView extends SearchDelegate {
  List<Product> filtered = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
          query = '';
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ProductsListView(product: filtered);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final prodcuts = context.read<StoreCubit>().products;
    if (query == '') {
      return ProductsListView(product: prodcuts);
    } else {
      filtered.clear();

      for (var product in prodcuts) {
        if (product.name!.toLowerCase().contains(query.toLowerCase())) {
          filtered.add(product);
        }
      }
      if (filtered.isEmpty) {
        return const EmptyWidget(text: 'Search');
      } else {
        return ProductsListView(product: filtered);
      }
    }
  }
}

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key, required this.product});
  final List<Product> product;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: product.length,
      itemBuilder: (context, index) {
        return FavoritesAdapterCard(product: product[index]);
      },
    );
  }
}

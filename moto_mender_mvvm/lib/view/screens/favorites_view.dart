import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/view/adapter/favorite_product_adapter.dart';
import 'package:moto_mender_mvvm/view_models/favorties/cubit/favorites_cubit.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    List<Product> products = context.read<FavoritesCubit>().favorites;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Gap(20),
            Text('Favorites', style: style.titleLarge),
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return FavoritesAdapterCard(product: products[index]);
              },
            )),
          ],
        ),
      ),
    );
  }
}

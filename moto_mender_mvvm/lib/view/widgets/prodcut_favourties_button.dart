import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/view_models/favorties_view_model/cubit/favorites_cubit.dart';

class ProductFavouritesButton extends StatelessWidget {
  const ProductFavouritesButton({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: IconButton(
          onPressed: () {
            context.read<FavoritesCubit>().addToFavorites(productId: productId);
          },
          icon: const Icon(
            color: Colors.red,
            Icons.favorite,
            size: 25,
          )),
    );
  }
}

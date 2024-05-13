import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/utils/functions/floating_bottom_sheet.dart';
import 'package:moto_mender_mvvm/view_models/favorties/cubit/favorites_cubit.dart';

class ProductFavouritesButton extends StatelessWidget {
  const ProductFavouritesButton({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    bool isFav =
        context.read<FavoritesCubit>().isProcutFavorite(productId: productId);
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
        if (state is FavoriteAdded) {
          showFloatingBottomSheet(
              text: 'Added To Favorite',
              context: context,
              backgroundColor: Colors.greenAccent);
        } else if (state is FavoriteDeleted) {
          showFloatingBottomSheet(
              text: 'Removed From Favorites', context: context);
        }
      },
      builder: (context, state) {
        return Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
                onPressed: () {
                  if (isFav) {
                    //  DELTE FAVORITE
                    context
                        .read<FavoritesCubit>()
                        .deleteFavorite(productId: productId);
                    isFav = false;
                  }
                  //  ADD FAVORITE
                  else {
                    context
                        .read<FavoritesCubit>()
                        .addToFavorites(productId: productId);
                    isFav = true;
                  }
                },
                icon: isFav
                    ? const Icon(
                        color: Colors.red,
                        Icons.favorite,
                        size: 25,
                      )
                    : const Icon(
                        Icons.favorite_outline,
                        color: Colors.red,
                        size: 25,
                      )));
      },
    );
  }
}

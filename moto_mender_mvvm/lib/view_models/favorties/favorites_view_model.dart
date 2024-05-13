import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/utils/functions/floating_bottom_sheet.dart';
import 'package:moto_mender_mvvm/view/screens/favorites_view.dart';
import 'package:moto_mender_mvvm/view/widgets/empty_widgets.dart';
import 'package:moto_mender_mvvm/view_models/favorties/cubit/favorites_cubit.dart';

class FavortiesViewModel extends StatelessWidget {
  const FavortiesViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
        if (state is FavoriteAdded) {
          showFloatingBottomSheet(
              text: 'Product Added To Favorites',
              context: context,
              backgroundColor: Colors.greenAccent);
        } else if (state is FavoriteDeleted) {
          showFloatingBottomSheet(
              text: 'Product Removed From Favorites', context: context);
        }
      },
      builder: (context, state) {
        if (state is FavoritesInitial) {
          context.read<FavoritesCubit>().getAllFavorites();
          return const FavoritesView();
        } else if (state is FavoritesEmpty) {
          return const EmptyWidget(
            text: 'Favorites',
          );
        } else {
          return const FavoritesView();
        }
      },
    );
  }
}

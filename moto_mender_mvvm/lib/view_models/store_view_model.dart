import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/cubits/store_cubit/store_cubit.dart';
import 'package:moto_mender_mvvm/view/screens/store_view.dart';

import 'favorties_view_model/cubit/favorites_cubit.dart';

class StoreViewModel extends StatelessWidget {
  const StoreViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<StoreCubit>().fetchProducts();
    // });
    // context.read<StoreCubit>().fetchProducts();
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
        if (state is StoreFailed) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is StoreSuccess) {
          context.read<FavoritesCubit>().productsIds =
              CacheHelper.currentUser.favorites ?? [];
          return StoreView(products: state.products);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

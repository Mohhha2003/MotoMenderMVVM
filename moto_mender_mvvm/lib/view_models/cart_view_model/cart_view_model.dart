import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/utils/functions/show_snackbar.dart';
import 'package:moto_mender_mvvm/view/screens/cart_view.dart';
import 'package:moto_mender_mvvm/view_models/cart_view_model/cubit/cart_cubit_cubit.dart';

class CartViewModel extends StatelessWidget {
  const CartViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartCubitState>(
      builder: (context, state) {
        if (state is ProductQuantityChanged) {
          return const CartView();
        } else if (state is CartEmpty) {
          return const CartView();
        } else {
          return const CartView();
        }
      },
      listener: (BuildContext context, CartCubitState state) {
        if (state is ProductRemoved) {
          showSnackBar(text: 'Product Removed', context: context);
        }
      },
    );
  }
}

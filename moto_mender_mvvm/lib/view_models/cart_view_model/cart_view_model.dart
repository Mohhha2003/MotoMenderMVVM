import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/utils/functions/dialog_utils.dart';
import 'package:moto_mender_mvvm/utils/functions/show_snackbar.dart';
import 'package:moto_mender_mvvm/view/screens/cart_view.dart';
import 'package:moto_mender_mvvm/view/widgets/empty_widgets.dart';
import 'package:moto_mender_mvvm/view_models/cart_view_model/cubit/cart_cubit_cubit.dart';

class CartViewModel extends StatelessWidget {
  const CartViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    //     TO TRIGGER THIS METHOD EVERY TIME THIS PAGE OPENS
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CartCubit>(context).getCartProducts();
    });

    return BlocConsumer<CartCubit, CartCubitState>(
      builder: (context, state) {
        if (state is CartBaseState || state is ProductQuantityChanged) {
          return const CartView();
        } else if (state is CartEmpty) {
          return const EmptyWidget(text: 'Cart');
        } else if (state is CartFailed) {
          return const EmptyWidget(text: 'Failed Failed');
        } else {
          return const CartView();
        }
      },
      listener: (BuildContext context, CartCubitState state) {
        if (state is ProductRemoved) {
          showSnackBar(text: 'Product Removed', context: context);
        } else if (state is Loading) {
          showLoading(context);
        } else if (state is EndLoading) {
          Navigator.of(context).pop();
        } else if (state is CartFailed) {
          Navigator.of(context).pop();
          showSnackBar(text: state.message, context: context);
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/utils/functions/floating_bottom_sheet.dart';
import 'package:moto_mender_mvvm/view/screens/product_view.dart';
import 'package:moto_mender_mvvm/view_models/cart_view_model/cubit/cart_cubit_cubit.dart';

class ProductViewModel extends StatelessWidget {
  const ProductViewModel({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartCubitState>(
      listener: (context, state) {
        if (state is ProductAdded) {
          showFloatingBottomSheet(
              text: 'Added To Cart',
              context: context,
              backgroundColor: Colors.greenAccent);
        } else if (state is CartFailed) {
          showFloatingBottomSheet(text: state.message, context: context);
        }
      },
      child: ProductView(
        product: product,
      ),
    );
  }
}

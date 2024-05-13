import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/utils/functions/navigate_with_animation.dart';
import 'package:moto_mender_mvvm/view_models/cart_view/cart_view_model.dart';

class CartViewButton extends StatelessWidget {
  const CartViewButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          navigateWithTransition(context, const CartViewModel());
        },
        icon: const Icon(
          Icons.shopping_bag_outlined,
          size: 35,
        ));
  }
}

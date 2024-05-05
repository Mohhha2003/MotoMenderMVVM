import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/view_models/cart_view_model/cart_view_model.dart';

class CartViewButton extends StatelessWidget {
  const CartViewButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CartViewModel(),
          ));
        },
        icon: const Icon(
          Icons.shopping_bag_outlined,
          size: 35,
        ));
  }
}

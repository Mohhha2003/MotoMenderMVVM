import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/view/screens/cart_view.dart';

class ViewCartButton extends StatelessWidget {
  const ViewCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CartView(),
          ));
        },
        icon: const Icon(
          Icons.shopping_bag_outlined,
          size: 35,
        ));
  }
}

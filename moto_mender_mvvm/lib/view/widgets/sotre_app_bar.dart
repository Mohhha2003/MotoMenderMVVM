import 'package:flutter/material.dart';
import 'view_cart_button.dart';

class StoreAppBar extends StatelessWidget {
  const StoreAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24),
      child: const Row(
        children: [
          Text(
            'MotoMender',
            // style: Style.logo,
          ),
          Spacer(),
          ViewCartButton()
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'prodcut_quantity_button.dart';


class ProductCartQuantityRow extends StatelessWidget {
  const ProductCartQuantityRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const ProdcutQuantityButton(
          color: Color(0xffD6D6D6),
          icon: Icons.remove,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '2',
            style: style.bodyLarge,
          ),
        ),
        const ProdcutQuantityButton(
          color: Color(0xff34D49E),
          icon: Icons.add,
        ),
      ],
    );
  }
}
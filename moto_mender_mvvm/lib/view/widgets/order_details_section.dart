import 'package:flutter/material.dart';

import 'cart_order_deatils_row.dart';
import 'custome_button.dart';
import 'promo_code_textfield.dart';



class OrderDetailsSection extends StatelessWidget {
  const OrderDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          PromoCodeTextFiled(style: style),
          const CartOrderDetailsRow(
            text: 'Subtotal',
          ),
          const CartOrderDetailsRow(
            text: 'Delivery Fee',
          ),
          const CartOrderDetailsRow(
            text: 'Discount',
          ),
          CustomeButton(
            style: style,
            text: 'Check Out',
          )
        ],
      ),
    );
  }
}

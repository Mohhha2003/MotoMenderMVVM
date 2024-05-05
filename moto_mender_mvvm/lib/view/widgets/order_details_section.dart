import 'package:flutter/material.dart';

import 'cart_order_deatils_row.dart';
import 'custom_button.dart';
import 'promo_code_textfield.dart';

class OrderDetailsSection extends StatelessWidget {
  const OrderDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return SizedBox(
      height: MediaQuery.of(context).size.height * .32,
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
          CustomButton(
            style: style,
            text: 'Check Out',
          )
        ],
      ),
    );
  }
}

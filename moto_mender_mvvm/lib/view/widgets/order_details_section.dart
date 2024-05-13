import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/view_models/cart_view/cubit/cart_cubit_cubit.dart';
import 'package:moto_mender_mvvm/view_models/confirm_order/cubit/order_cubit.dart';
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
          CartOrderDetailsRow(
            price: context.read<CartCubit>().subtotal.toString(),
            text: 'Subtotal',
          ),
          CartOrderDetailsRow(
            price: context.read<CartCubit>().deleviryFee.toString(),
            text: 'Delivery Fee',
          ),
          CartOrderDetailsRow(
            price: context.read<CartCubit>().discount.toString(),
            text: 'Discount',
          ),
          CustomButton(
            onPressed: () {
              context.read<ConfirmOrderCubit>().placeNewOrder(
                  products: context.read<CartCubit>().cartProducts.products!);
              context.read<CartCubit>().cartProducts.products?.clear();
            },
            style: style,
            text: 'Check Out',
          )
        ],
      ),
    );
  }
}

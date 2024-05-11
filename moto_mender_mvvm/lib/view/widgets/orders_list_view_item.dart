import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/models/cart_model/cart_product_list_model.dart';
import 'package:moto_mender_mvvm/view/widgets/order_product_list_item.dart';




class OrderListViewItem extends StatelessWidget {
  const OrderListViewItem({
    super.key,
    required this.style,
    required this.products,
  });

  final TextTheme style;
  final CartProductsListModel products;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(12)),
        child: OrderProductListItem(
          style: style,
          product: products,
        ));
  }
}

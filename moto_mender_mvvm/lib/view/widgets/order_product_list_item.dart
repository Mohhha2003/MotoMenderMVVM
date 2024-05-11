import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/models/cart_model/cart_product_list_model.dart';

class OrderProductListItem extends StatelessWidget {
  const OrderProductListItem({
    super.key,
    required this.style,
    required this.product,
  });

  final TextTheme style;
  final CartProductsListModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${product.quantity} x${product.product!.name}',
          style: style.bodyLarge,
        ),
        const Spacer(),
        Text(
          '\$ ${product.product!.price! * product.quantity!}',
          style: style.titleMedium,
        ),
      ],
    );
  }
}

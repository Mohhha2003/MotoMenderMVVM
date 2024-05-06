import 'package:flutter/material.dart';

class CartOrderDetailsRow extends StatelessWidget {
  const CartOrderDetailsRow({
    super.key,
    required this.text,
    required this.price,
  });

  final String text;
  final String price;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Text(
            '$text :',
            style: style.bodyLarge,
          ),
          const Spacer(),
          Text(price, style: style.bodyLarge)
        ],
      ),
    );
  }
}

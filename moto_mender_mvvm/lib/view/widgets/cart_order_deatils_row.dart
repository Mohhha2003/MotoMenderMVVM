import 'package:flutter/material.dart';



class CartOrderDetailsRow extends StatelessWidget {
  const CartOrderDetailsRow({
    super.key,
    required this.text,
  });

  final String text;

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
          Text('335.00', style: style.bodyLarge)
        ],
      ),
    );
  }
}

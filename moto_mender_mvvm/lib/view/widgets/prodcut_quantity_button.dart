import 'package:flutter/material.dart';

class ProdcutQuantityButton extends StatelessWidget {
  const ProdcutQuantityButton({
    super.key,
    required this.icon,
    required this.color,
    this.onTap,
  });

  final IconData icon;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: color)),
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}

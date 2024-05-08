import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.style,
      this.onPressed,
      required this.text,
      this.padding,
      this.color});

  final void Function()? onPressed;
  final String text;
  final TextTheme style;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 10),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
      minWidth: 350,
      color: color ?? const Color(0xff34D49E),
      onPressed: () => onPressed!(),
      child: Text(
        text,
        style: style.bodySmall,
      ),
    );
  }
}

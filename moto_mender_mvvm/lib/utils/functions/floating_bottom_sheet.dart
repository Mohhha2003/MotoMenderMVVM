import 'package:flutter/material.dart';

void showFloatingBottomSheet(
    {required String text,
    required BuildContext context,
    Color? backgroundColor}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(text),
    backgroundColor: backgroundColor ?? Colors.red,
    duration: const Duration(milliseconds: 300),
  ));
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSnackBar(
    {required String text,
    required BuildContext context,
    Color? backgroundColor}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(text),
    backgroundColor: backgroundColor ?? Colors.red,
    duration: const Duration(milliseconds: 800),
  ));
}

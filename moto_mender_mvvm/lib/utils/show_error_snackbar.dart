import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showErrorSnackBar({required String text, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: Colors.red,
    duration: const Duration(milliseconds: 300),
  ));
}

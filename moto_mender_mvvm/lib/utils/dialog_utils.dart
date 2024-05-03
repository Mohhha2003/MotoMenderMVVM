import 'package:flutter/material.dart';

void showLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          content: Row(
            children: [
              Text(
                "loading",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Spacer(),
              const CircularProgressIndicator()
            ],
          ),
        );
      });
}

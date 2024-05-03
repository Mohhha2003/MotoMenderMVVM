import 'package:flutter/material.dart';

class StoreCategorieButton extends StatelessWidget {
  const StoreCategorieButton({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 40,
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5)),
        color: const Color(0xff0CBB80),
        onPressed: () {},
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        ));
  }
}

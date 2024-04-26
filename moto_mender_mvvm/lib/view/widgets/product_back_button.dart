import 'package:flutter/material.dart';

class ProductBackButton extends StatelessWidget {
  const ProductBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.fromBorderSide(
              BorderSide(width: 0.5, color: Color(0xffDADADA)))),
      child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          )),
    );
  }
}

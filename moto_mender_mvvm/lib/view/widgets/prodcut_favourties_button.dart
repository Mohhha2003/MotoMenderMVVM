import 'package:flutter/material.dart';

class ProductFavouritesButton extends StatelessWidget {
  const ProductFavouritesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: IconButton(
          onPressed: () {},
          icon: const Icon(
            color: Colors.red,
            Icons.favorite,
            size: 25,
          )),
    );
  }
}

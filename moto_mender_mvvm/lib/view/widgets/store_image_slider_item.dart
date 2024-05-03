import 'package:flutter/material.dart';

class StoreImageSliderItem extends StatelessWidget {
  const StoreImageSliderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/image/store.png',
          width: 380,
          height: 155,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

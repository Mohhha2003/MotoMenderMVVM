import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/view/screens/cart_view.dart';

class ProductBottomNavBar extends StatelessWidget {
  const ProductBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          children: [
            Text(
              '164.00 EGP',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            MaterialButton(
              minWidth: 160,
              color: const Color(0xff34D49E),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CartView(),
                ));
              },
              child: Text(
                'Add To Cart',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}

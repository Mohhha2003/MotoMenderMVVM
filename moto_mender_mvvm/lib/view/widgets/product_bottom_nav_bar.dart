import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/models/product_request_model/product.dart';

class ProductBottomNavBar extends StatelessWidget {
  const ProductBottomNavBar({
    super.key,
    required this.product,
  });

  final Product product;

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
              '${product.price} EGP',
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
                // Navigator.of(context).push(MaterialPageRouwte(
                //   builder: (context) => CartView(),
                // ));
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

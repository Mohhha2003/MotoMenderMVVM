import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/view_models/cart_view_model/cubit/cart_cubit_cubit.dart';

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
                context
                    .read<CartCubit>()
                    .addToCart(productId: product.productId!);
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/view/widgets/prodcut_quantity_button.dart';
import 'package:moto_mender_mvvm/view_models/cart_view_model/cubit/cart_cubit_cubit.dart';

class ProductCartQuantityRow extends StatelessWidget {
  const ProductCartQuantityRow({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;

    return BlocBuilder<CartCubit, CartCubitState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ProdcutQuantityButton(
              onTap: () {
                context.read<CartCubit>().decrementQuantity(product: product);
              },
              color: const Color(0xffD6D6D6),
              icon: Icons.remove,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '${product.orderQuantity}',
                style: style.bodyLarge,
              ),
            ),
            ProdcutQuantityButton(
              onTap: () {
                context.read<CartCubit>().incrementQuantity(product: product);
              },
              color: const Color(0xff34D49E),
              icon: Icons.add,
            ),
          ],
        );
      },
    );
  }
}

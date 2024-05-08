import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/models/cart_model/cart_product_list_model.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/view_models/cart_view_model/cubit/cart_cubit_cubit.dart';
import '../widgets/product_quantity_row.dart';

class CartProdcutAdapter extends StatelessWidget {
  const CartProdcutAdapter({
    super.key,
    required this.cartProduct,
  });

  final CartProductsListModel cartProduct;

  @override
  Widget build(BuildContext context) {
      final Product product = cartProduct.product!;
    var style = Theme.of(context).textTheme;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 20, top: 20),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color(0xffE7E4E4), width: 1))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.network(
                    '${product.imagePath}',
                    width: 100,
                    height: 100,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.name}',
                      style: style.bodyLarge,
                    ),
                    Text(
                      '${product.description}',
                      style: style.labelSmall,
                    ),
                    const Gap(20),
                    Text(
                      '${product.price} EGP',
                      style: style.bodyLarge,
                    )
                  ],
                ),
              ]),
              ProductCartQuantityRow(product: product, quantity: cartProduct.quantity.toString(),)
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
              onPressed: () {
                context
                    .read<CartCubit>()
                    .removeCartProduct(productId: product.productId!);
              },
              icon: const Icon(
                Icons.clear,
                size: 20,
                color: Colors.grey,
              )),
        ),
      ],
    );
  }
}

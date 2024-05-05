import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/view/widgets/empty_widgets.dart';
import 'package:moto_mender_mvvm/view/widgets/product_back_button.dart';
import 'package:moto_mender_mvvm/view_models/cart_view_model/cubit/cart_cubit_cubit.dart';
import '../adapter/cart_product_adapter.dart';
import '../widgets/order_details_section.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = context.read<CartCubit>().cartProducts;
    return Scaffold(
      bottomNavigationBar:
          products.isEmpty ? const SizedBox() : const OrderDetailsSection(),
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        leading: const ProductBackButton(),
      ),
      body: products.isEmpty
          ? const EmptyWidget()
          : Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return CartProdcutAdapter(
                      product: products[index],
                    );
                  },
                )),
              ],
            ),
    );
  }
}

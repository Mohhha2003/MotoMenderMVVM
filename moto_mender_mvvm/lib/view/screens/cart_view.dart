import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/utils/functions/navigation_with_slide.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_button.dart';
import 'package:moto_mender_mvvm/view/widgets/product_back_button.dart';
import 'package:moto_mender_mvvm/view_models/cart_view_model/cubit/cart_cubit_cubit.dart';
import 'package:moto_mender_mvvm/view_models/confirm_order_view_mdoel/confirm_order_view_model.dart';
import '../adapter/cart_product_adapter.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    var cartProducts = BlocProvider.of<CartCubit>(context).cartProducts;
    return BlocBuilder<CartCubit, CartCubitState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            centerTitle: true,
            leading: const CustomBackButton(),
          ),
          body: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: cartProducts.products?.length,
                itemBuilder: (context, index) {
                  return CartProdcutAdapter(
                    cartProduct: cartProducts.products![index],
                  );
                },
              )),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomButton(
                  onPressed: () {
                    navigationWithSlide(
                        context,
                        ConfirmOrderViewModel(
                          products: cartProducts.products,
                        ));
                  },
                  style: style,
                  text: 'Check Out ',
                  padding: const EdgeInsets.symmetric(vertical: 25),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

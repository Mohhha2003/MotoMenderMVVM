import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/view/widgets/product_back_button.dart';

import '../adapter/cart_product_adapter.dart';
import '../widgets/order_details_section.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        leading: const ProductBackButton(),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: 3,
            itemBuilder: (context, index) {
              return const CartProdcutAdapter();
            },
          )),
          const OrderDetailsSection(),
        ],
      ),
    );
  }
}
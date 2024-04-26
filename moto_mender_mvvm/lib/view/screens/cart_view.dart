import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/view/widgets/product_back_button.dart';

import '../adapter/cart_product_adapter.dart';

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

class OrderDetailsSection extends StatelessWidget {
  const OrderDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          PromoCodeTextFiled(style: style),
          const CartOrderDetailsRow(
            text: 'Subtotal',
          ),
          const CartOrderDetailsRow(
            text: 'Delivery Fee',
          ),
          const CartOrderDetailsRow(
            text: 'Discount',
          ),
          CustomeButton(
            style: style,
            text: 'Check Out',
          )
        ],
      ),
    );
  }
}

class CustomeButton extends StatelessWidget {
  const CustomeButton(
      {super.key,
      required this.style,
      this.onPressed,
      required this.text,
      this.padding});

  final void Function()? onPressed;
  final String text;
  final TextTheme style;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 10),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
      minWidth: 350,
      color: const Color(0xff34D49E),
      onPressed: () => onPressed,
      child: Text(
        text,
        style: style.bodySmall,
      ),
    );
  }
}

class PromoCodeTextFiled extends StatelessWidget {
  const PromoCodeTextFiled({
    super.key,
    required this.style,
  });

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextField(
        decoration: InputDecoration(
            suffixText: 'promocode applied',
            suffixIcon: const Icon(
              Icons.done_rounded,
              color: Color(0xff34D49E),
            ),
            suffixStyle: style.labelMedium,
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffFFFFFF), width: .9),
                borderRadius: BorderRadius.circular(12)),
            hintText: 'Enter Your promo code',
            border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffFFFFFF), width: .9),
                borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}

class CartOrderDetailsRow extends StatelessWidget {
  const CartOrderDetailsRow({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Text(
            '$text :',
            style: style.bodyLarge,
          ),
          const Spacer(),
          Text('335.00', style: style.bodyLarge)
        ],
      ),
    );
  }
}

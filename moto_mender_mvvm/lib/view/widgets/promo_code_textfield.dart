import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/view_models/cart_view/cubit/cart_cubit_cubit.dart';

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
        onChanged: (value) {},
        controller: context.read<CartCubit>().promoCode,
        decoration: InputDecoration(
            suffixText: 'promocode applied',
            suffixIcon:
                const Icon(Icons.done_rounded, color: Color(0xff34D49E)),
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

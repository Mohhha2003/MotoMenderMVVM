import 'package:flutter/material.dart';


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

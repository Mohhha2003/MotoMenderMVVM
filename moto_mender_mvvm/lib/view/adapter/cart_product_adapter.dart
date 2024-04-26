import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/product_quantity_row.dart';

class CartProdcutAdapter extends StatelessWidget {
  const CartProdcutAdapter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 20, top: 15),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color(0xffE7E4E4), width: 1))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset('assets/image/product.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Microfiber Cleaning',
                      style: style.bodyLarge,
                    ),
                    Text(
                      '12 Pack',
                      style: style.labelSmall,
                    ),
                    const Gap(20),
                    Text(
                      '174.00',
                      style: style.bodyLarge,
                    )
                  ],
                ),
              ]),
              const ProductCartQuantityRow()
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
              onPressed: () {},
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

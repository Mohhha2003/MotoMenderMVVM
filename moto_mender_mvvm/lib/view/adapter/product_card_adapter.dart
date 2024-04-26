import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/view/screens/product_view.dart';

class ProdcutGridViewItem extends StatelessWidget {
  const ProdcutGridViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ProductView(),
        ));
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              'assets/image/product.png',
            ),
          ),
          const Gap(10),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'Microfiber Cleaning',
                    style: Theme.of(context).textTheme.displaySmall,
                    overflow: TextOverflow.fade,
                  ),
                ),
                Image.asset(
                  'assets/image/star.png',
                  width: 22,
                  height: 19,
                ),
                const Text(
                  '4.9',
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text('82.00 EGP'),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/utils/functions/navigate_with_animation.dart';
import 'package:moto_mender_mvvm/view_models/product_view_model.dart';

class ProdcutGridViewItem extends StatelessWidget {
  const ProdcutGridViewItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateWithTransition(
          context,
          ProductViewModel(
            product: product,
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: 130,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(10)),
            child: Image.network(
              width: 140,
              fit: BoxFit.cover,
              '${product.imagePath}',
            ),
          ),
          const Gap(10),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    '${product.name}',
                    style: Theme.of(context).textTheme.displaySmall,
                    overflow: TextOverflow.fade,
                  ),
                ),
                Image.asset(
                  'assets/image/star.png',
                  width: 22,
                  height: 19,
                ),
                Text(
                  '${product.ratingAverage}',
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('${product.price}'),
          )
        ],
      ),
    );
  }
}

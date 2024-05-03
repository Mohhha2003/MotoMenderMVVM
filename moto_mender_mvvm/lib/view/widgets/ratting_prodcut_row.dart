import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/models/product_request_model/product.dart';

class RattingReviewsProdcutRow extends StatelessWidget {
  const RattingReviewsProdcutRow({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: .5)),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text(
                '${product.ratingAverage}',
              )
            ],
          ),
        ),
        const Gap(30),
        Text('${product.id}', style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}

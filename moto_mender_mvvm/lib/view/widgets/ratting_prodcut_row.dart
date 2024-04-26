import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RattingReviewsProdcutRow extends StatelessWidget {
  const RattingReviewsProdcutRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: .5)),
          child: const Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text(
                '4.8',
              )
            ],
          ),
        ),
        const Gap(30),
        Text('28 reviews', style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}

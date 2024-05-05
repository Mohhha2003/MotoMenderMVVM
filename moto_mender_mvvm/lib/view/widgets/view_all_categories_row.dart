import 'package:flutter/material.dart';

class ViewAllCategoriesRow extends StatelessWidget {
  const ViewAllCategoriesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            Text(
              'Categoires',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            TextButton(
                onPressed: () {},
                child: Text(
                  'View All',
                  style: Theme.of(context).textTheme.labelMedium,
                ))
          ],
        ),
      ),
    );
  }
}

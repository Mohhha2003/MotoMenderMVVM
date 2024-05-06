import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/utils/functions/navigation_with_slide.dart';
import 'package:moto_mender_mvvm/view/screens/view_all_view.dart';

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
                onPressed: () {
                  navigationWithSlide(context, const ViewAllView());
                },
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

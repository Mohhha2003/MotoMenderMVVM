

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';



class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/image/svg/empty.svg',
              height: MediaQuery.of(context).size.height * .3,
            ),
            const Gap(20),
            Text(
              'Cart is Empty',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      );
  }
}

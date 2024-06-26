import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/utils/functions/navigate_with_animation.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_image_network.dart';
import 'package:moto_mender_mvvm/view_models/favorties/cubit/favorites_cubit.dart';
import 'package:moto_mender_mvvm/view_models/product_view_model.dart';

class FavoritesAdapterCard extends StatelessWidget {
  FavoritesAdapterCard({
    super.key,
    required this.product,
  });

  final Product product;
  final GlobalKey<State<StatefulWidget>> _dismissableKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Dismissible(
      background: Container(
        color: Colors.red,
        child: const Icon(Icons.delete),
      ),
      direction: DismissDirection.endToStart,
      key: _dismissableKey,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          context
              .read<FavoritesCubit>()
              .deleteFavorite(productId: product.productId!);
        }
      },
      child: InkWell(
        onTap: () {
          navigateWithTransition(context, ProductViewModel(product: product));
        },
        child: Container(
          padding: const EdgeInsets.only(bottom: 20, top: 20),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color(0xffE7E4E4), width: 1))),
          child: Row(children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomImageNetwork(
                  imgPath: product.imagePath!,
                  height: 100,
                  width: 120,
                  fit: BoxFit.contain,
                )),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product.name}',
                    style: style.bodyLarge,
                  ),
                  Text(
                    '${product.description}',
                    style: style.labelSmall,
                  ),
                  const Gap(20),
                  Text(
                    '${product.price} EGP',
                    style: style.bodyLarge,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

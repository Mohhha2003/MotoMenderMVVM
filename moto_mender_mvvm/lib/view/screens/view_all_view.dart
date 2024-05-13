import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/view/widgets/product_grid_view.dart';
import 'package:moto_mender_mvvm/view_models/view_all_view_model/cubit/view_all_cubit.dart';

class ViewAllView extends StatelessWidget {
  const ViewAllView({super.key, required this.porducts});

  final List<Product> porducts;
  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'All Prodcuts',
            style: style.titleLarge,
          ),
        ),
        body: ProductsGirdView(
            products: context.read<ViewAllCubit>().state.products,
            onEndRached: () => context.read<ViewAllCubit>().onEndReached(),
            isLoading: context.read<ViewAllCubit>().state.isLoading));
  }
}

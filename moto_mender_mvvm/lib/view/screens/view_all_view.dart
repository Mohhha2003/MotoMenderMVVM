import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/cubits/store_cubit/store_cubit.dart';
import 'package:moto_mender_mvvm/view/widgets/product_grid_view.dart';

class ViewAllView extends StatelessWidget {
  const ViewAllView({super.key});

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
        body: ProdcutsGridView(products: context.read<StoreCubit>().products));
  }
}

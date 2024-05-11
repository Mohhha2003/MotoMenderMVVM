import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/cubits/store_cubit/store_cubit.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/view/adapter/product_card_adapter.dart';
import 'package:moto_mender_mvvm/view_models/view_all_view_model/cubit/view_all_cubit.dart';

class ProdcutsGridView extends StatefulWidget {
  const ProdcutsGridView({super.key, required this.products});
  final List<Product> products;

  @override
  State<ProdcutsGridView> createState() => _ProdcutsGridViewState();
}

class _ProdcutsGridViewState extends State<ProdcutsGridView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    context.read<ViewAllCubit>().onEndReached(_scrollController);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: widget.products.length +
          (context.read<ViewAllCubit>().state.isLoading ? 0 : 2),
      itemBuilder: (context, index) {
        if (index < widget.products.length) {
          return ProdcutGridViewItem(product: widget.products[index]);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        crossAxisCount: 2,
      ),
    );
  }
}

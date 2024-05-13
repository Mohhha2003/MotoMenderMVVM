import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/view/adapter/product_card_adapter.dart';

class ProductsGirdView extends StatefulWidget {
  const ProductsGirdView(
      {super.key,
      required this.products,
      required this.onEndRached,
      required this.isLoading});
  final List<Product> products;
  final VoidCallback onEndRached;
  final bool isLoading;

  @override
  State<ProductsGirdView> createState() => _ProductsGirdViewState();
}

class _ProductsGirdViewState extends State<ProductsGirdView> {
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
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;

    if (maxScroll == currentScroll) {
      widget.onEndRached();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: (widget.products.length) + (widget.isLoading ? 0 : 2),
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

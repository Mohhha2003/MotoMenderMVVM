import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/models/product.dart';
import 'package:moto_mender_mvvm/view/widgets/product_grid_view.dart';

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
        body: ProdcutsGridView(products: porducts));
  }
}

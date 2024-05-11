import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/models/cart_model/cart_product_list_model.dart';
import 'package:moto_mender_mvvm/view/widgets/order_details_section.dart';
import 'package:moto_mender_mvvm/view/widgets/orders_list_view_item.dart';

class ConfirmOrderView extends StatelessWidget {
  const ConfirmOrderView({super.key, required this.products});

  final List<CartProductsListModel>? products;
  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      bottomNavigationBar: const OrderDetailsSection(),
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Details',
            style: style.titleLarge,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: products!.length,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              return OrderListViewItem(
                  style: style, products: products![index]);
            },
          )),
          const Gap(30)
        ],
      ),
    );
  }
}

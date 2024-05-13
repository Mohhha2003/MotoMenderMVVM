import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/models/order_request/order_request.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key, required this.orders});

  final OrderRequest orders;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
          style: style.displayLarge,
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: orders.count,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: ListTile(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  title: Text(
                    'OrderId : ${orders.orders?[index].orderId}',
                    textAlign: TextAlign.justify,
                  ),
                  subtitle: Text('total :  ${orders.orders?[index].orderDate}'),
                  trailing: Text('Status:  ${orders.orders?[index].status}'),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/models/order_request/order.dart';
import 'package:moto_mender_mvvm/utils/functions/navigation_with_slide.dart';
import 'package:moto_mender_mvvm/view/screens/order_details_view.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

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
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: ListTile(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  title: Text('OrderId : dkljlafjlds'),
                  subtitle: Text('total : 40324'),
                  trailing: Text('Status: Preparing'),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}

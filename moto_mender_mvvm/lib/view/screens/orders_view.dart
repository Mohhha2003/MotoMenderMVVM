import 'package:flutter/material.dart';

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
                  title:const  Text('OrderId : dkljlafjlds'),
                  subtitle:const  Text('total : 40324'),
                  trailing:const Text('Status: Preparing'),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}

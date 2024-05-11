// import 'package:flutter/material.dart';
// import 'package:moto_mender_mvvm/models/order_request/order.dart';
// import 'package:moto_mender_mvvm/view/widgets/orders_list_view_item.dart';

// class OrderDetailsView extends StatelessWidget {
//   const OrderDetailsView({super.key, required this.order});

//   final Order order;

//   @override
//   Widget build(BuildContext context) {
//     var style = Theme.of(context).textTheme;
//     return CustomScrollView(
//       slivers: [
//         SliverAppBar(
//           title: Text(
//             '${order.orderId}',
//             style: style.displayLarge,
//           ),
//         ),
//         SliverList.builder(
//           itemBuilder: (context, index) {
//             return OrderListViewItem(
//                 style: style, products: order.products![index]!);
//           },
//         )
//       ],
//     );
//   }
// }

import 'order.dart';

class OrderRequest {
  String? status;
  int? count;
  List<Order>? orders;

  OrderRequest({this.status, this.count, this.orders});

  factory OrderRequest.fromJson(Map<String, dynamic> json) => OrderRequest(
        status: json['status'] as String?,
        count: json['count'] as int?,
        orders: (json['orders'] as List<dynamic>?)
            ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'count': count,
        'orders': orders?.map((e) => e.toJson()).toList(),
      };
}

import 'package:moto_mender_mvvm/models/product.dart';

class Order {
  String? userId;
  String? status;
  List<Product>? products;
  String? orderId;
  DateTime? orderDate;

  Order({
    this.userId,
    this.status,
    this.products,
    this.orderId,
    this.orderDate,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        userId: json['userId'] as String?,
        status: json['status'] as String?,
        products: (json['productId'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        orderId: json['orderId'] as String?,
        orderDate: json['orderDate'] == null
            ? null
            : DateTime.parse(json['orderDate'] as String),
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'status': status,
        'products': products?.map((e) => e.toJson()).toList(),
        'orderId': orderId,
        'orderDate': orderDate?.toIso8601String(),
      };
}

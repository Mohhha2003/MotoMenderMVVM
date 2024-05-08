import 'package:moto_mender_mvvm/models/product.dart';

class CartProductsListModel {
  Product? product;
  int? quantity;
  String? id;

  CartProductsListModel({this.product, this.quantity, this.id});

  factory CartProductsListModel.fromJson(Map<String, dynamic> json) =>
      CartProductsListModel(
        product: json['productId'] == null
            ? null
            : Product.fromJson(json['productId'] as Map<String, dynamic>),
        quantity: json['quantity'] as int?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'productId': product?.toJson(),
        'quantity': quantity,
        '_id': id,
      };
}

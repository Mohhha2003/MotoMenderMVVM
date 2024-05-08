import 'cart_product_list_model.dart';

class CartModel {
  List<CartProductsListModel>? products;

  CartModel({this.products});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        products: (json['products'] as List<dynamic>?)
            ?.map((e) =>
                CartProductsListModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'products': products?.map((e) => e.toJson()).toList(),
      };
}

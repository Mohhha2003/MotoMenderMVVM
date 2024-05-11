class OrderProduct {
  String? productId;
  int? quantity;
  String? id;

  OrderProduct({this.productId, this.quantity, this.id});

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
        productId: json['productId'] as String?,
        quantity: json['quantity'] as int?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'quantity': quantity,
        '_id': id,
      };
}

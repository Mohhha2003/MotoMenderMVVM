class Product {
  String? id;
  String? name;
  String? description;
  int? price;
  String? category;
  String? imagePath;
  int? ratingAverage;
  String? productId;
  int? orderQuantity;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.category,
    this.imagePath,
    this.ratingAverage,
    this.productId,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        price: json['price'] as int?,
        category: json['category'] as String?,
        imagePath: json['imagePath']
            .toString()
            .replaceFirst('localhost', '10.0.2.2') as String?,
        ratingAverage: json['ratingAverage'] as int?,
        productId: json['productId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'description': description,
        'price': price,
        'category': category,
        'imagePath': imagePath,
        'ratingAverage': ratingAverage,
        'productId': productId,
      };
}

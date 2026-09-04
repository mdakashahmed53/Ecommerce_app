// "_id": "679a06ad8ddf463f174f0df6",
// "title": "New product 3",
// "brand": "6799d84bceaaf5d3413a0989",
// "categories": [
// "6799d7b8a164eec94185022f",
// "6799c5d785b54cac3abec28f"
// ],
// "slug": "new-productds",
// "meta_description": null,
// "description": "cat description fgjh fgjh fj fj",
// "photos": [],
// "colors": [],
// "sizes": [],
// "tags": [],
// "regular_price": null,
// "current_price": 12000,
// "quantity": 1,
// "createdAt": "2025-01-29T10:45:01.225Z",
// "updatedAt": "2025-01-29T10:45:01.225Z",
// "__v": 0

import '../../../products/data/product_model.dart';

class CartModel {
  final String id;
  final ProductModel product;
  int quantity;
  final String? color;
  final String? size;

  CartModel({
    required this.id,
    required this.product,
    required this.quantity,
    this.color,
    this.size,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['_id'],
      product: ProductModel.fromJson(json['product']),
      quantity: json['quantity'],
      color: json['color'],
      size: json['size'],
    );
  }
}

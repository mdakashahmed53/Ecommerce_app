class ProductDetailsModel {
  final String id;
  final String title;
  final String description;
  final List<String> photos;
  final List<String> colors;
  final List<String> sizes;
  final int currentPrice;
  final int quantity;
  final int regularPrice;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.photos,
    required this.colors,
    required this.sizes,
    required this.currentPrice,
    required this.quantity,
    required this.regularPrice,
    required this.description,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['_id'],
      title: json['title'] ,
      photos: List<String>.from(json['photos'] ?? []),
      colors: List<String>.from(json['colors'] ?? []),
      sizes: List<String>.from(json['sizes'] ?? []),
      currentPrice: json['current_price'] ?? 0,
      quantity: json['quantity'] ?? 0,
      regularPrice: json['regular_price'] ?? 0,
      description: json['description'] ,
    );
  }
}

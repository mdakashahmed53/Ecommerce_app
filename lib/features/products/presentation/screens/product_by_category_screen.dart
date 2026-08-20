import 'package:ecommerce_app/features/shared/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductByCategoryScreen extends StatefulWidget {
  const ProductByCategoryScreen({super.key, required this.categoryName});

  static const String name = '/products_by_category';

  final String categoryName;

  @override
  State<ProductByCategoryScreen> createState() =>
      _ProductByCategoryScreenState();
}

class _ProductByCategoryScreenState extends State<ProductByCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.75,

          ),
          itemBuilder: (context, index) {
            return FittedBox(child: ProductItem());
          },
        ),
      ),
    );
  }
}

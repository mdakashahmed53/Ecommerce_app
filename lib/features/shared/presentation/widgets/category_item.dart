import 'package:ecommerce_app/features/products/presentation/screens/product_by_category_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/exentension/utility.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductByCategoryScreen.name, arguments: 'Electronics');
      },
      child: Column(
        spacing: 8,
        children: [
          Container(
            padding: .all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withAlpha(30),
              borderRadius: .circular(12),
            ),
            child: Icon(icon, size: 48, color: AppColors.themeColor),
          ),
          Text(
            _getTitle(title),
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.themeColor,
            ),
          ),
        ],
      ),
    );
  }

  String _getTitle(String category) {
    if (category.length > 11) {
      return '${category.substring(0, 8)}..';
    } else {
      return category;
    }
  }
}

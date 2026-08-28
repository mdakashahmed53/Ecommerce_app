import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/features/category/data/category_model.dart';
import 'package:ecommerce_app/features/products/presentation/screens/product_by_category_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/exentension/utility.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductByCategoryScreen.name,
          arguments: category,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withAlpha(30),
              borderRadius: BorderRadius.circular(12),
            ),
            child: CachedNetworkImage(
              imageUrl: category.icon,
              height: 40,
              width: 40,
              fit: BoxFit.contain,
              errorWidget: (_, __, ___) => const Icon(
                Icons.error,
                size: 40,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _getTitle(category.title),
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.themeColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  String _getTitle(String title) {
    if (title.length > 10) {
      return '${title.substring(0, 8)}..';
    } else {
      return title;
    }
  }
}

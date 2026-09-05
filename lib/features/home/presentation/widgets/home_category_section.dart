import 'package:ecommerce_app/features/shared/presentation/widgets/centered_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../category/presentation/providers/category_list_provider.dart';
import '../../../shared/presentation/widgets/category_item.dart';

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,

      child: Consumer<CategoryListProvider>(
        builder: (context, categoryListProvider, _) {
          if (categoryListProvider.initialLoading) {
            return CenteredProgressIndicator();
          }
          if (categoryListProvider.category.isEmpty) {
            return Text('No categories found.');
          }

          return ListView.separated(
            scrollDirection: .horizontal,
            itemCount: _getCategoryLent(categoryListProvider.category.length),
            itemBuilder: (context, index) {
              return CategoryItem(category: categoryListProvider.category[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 8);
            },
          );
        },
      ),
    );
  }

  int _getCategoryLent(int length) {
    return length > 10 ? 10 : length;
  }
}

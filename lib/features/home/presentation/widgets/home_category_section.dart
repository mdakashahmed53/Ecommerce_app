import 'package:ecommerce_app/features/shared/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(

        scrollDirection: .horizontal,
          itemCount: 10,
          itemBuilder: (context, index){
        return CategoryItem(title: 'Electronics', icon: Icons.computer,);

      },
      separatorBuilder: (context, index){
          return SizedBox(width: 8,);
      },
      ),
    );
  }
}

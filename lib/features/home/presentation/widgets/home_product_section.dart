import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../products/presentation/provider/product_list_provider.dart';
import '../../../shared/presentation/widgets/product_item.dart';


class HomeProductSection extends StatelessWidget {
  const HomeProductSection({super.key,});

  // work here product list home screen show && product list screen show




  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Consumer<ProductListProvider>(
        builder: (context, productListProvider, _) {
          
          if (productListProvider.initialLoading) {
            return CircularProgressIndicator();
          }
          if (productListProvider.products.isEmpty) {
            return Text('No categories found.');
          }

          return ListView.builder(
            scrollDirection: .horizontal,
              itemCount: _getCategoryLent(productListProvider.products.length),
              itemBuilder: (context, index){
                return ProductItem(product: productListProvider.products[index],);
              }
          
          );
        }
      ),
    );
  }

  int _getCategoryLent(int length) {
    return length > 10 ? 10 : length;
  }
}

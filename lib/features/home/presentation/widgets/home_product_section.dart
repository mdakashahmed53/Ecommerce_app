import 'package:flutter/material.dart';

import '../../../products/data/product_model.dart';
import '../../../shared/presentation/widgets/product_item.dart';


class HomeProductSection extends StatelessWidget {
  const HomeProductSection({super.key, required this._products,});

  // work here product list home screen show && product list screen show

  final List<ProductModel> _products ;




  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child:ListView.builder(
            scrollDirection: .horizontal,
              itemCount: _getCategoryLent(_products.length),
              itemBuilder: (context, index){
                return ProductItem(product: _products[index],);
              }
          
          )

    );
  }

  int _getCategoryLent(int length) {
    return length > 10 ? 10 : length;
  }
}

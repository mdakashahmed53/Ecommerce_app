import 'package:ecommerce_app/features/shared/presentation/widgets/product_item.dart';
import 'package:flutter/cupertino.dart';

class HomeProductSection extends StatelessWidget {
  const HomeProductSection({super.key, required this.products});

  final List<String> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: .horizontal,
          itemCount: 10,
          itemBuilder: (context, index){
            return ProductItem();
          }

      ),
    );
  }
}

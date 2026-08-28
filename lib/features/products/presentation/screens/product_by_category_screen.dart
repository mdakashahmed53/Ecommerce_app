import 'package:ecommerce_app/features/category/data/category_model.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/centered_progress_indicator.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product_list_provider.dart';

class ProductByCategoryScreen extends StatefulWidget {
  const ProductByCategoryScreen({super.key, required this.category});

  static const String name = '/products_by_category';

  final CategoryModel category;

  @override
  State<ProductByCategoryScreen> createState() =>
      _ProductByCategoryScreenState();
}

class _ProductByCategoryScreenState extends State<ProductByCategoryScreen> {

  final ProductListProvider _productListProvider = ProductListProvider();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productListProvider.getProductListByCategory(widget.category.id);
    _scrollController.addListener(_loadMore);
  }


    void _loadMore() {
      if (_productListProvider.isLoading == false &&
          _scrollController.position.extentBefore < 300) {
        _productListProvider.getProductListByCategory(widget.category.id);
      }
    }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _productListProvider,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.category.title)),
        body: Consumer<ProductListProvider>(
          builder: (context,_,_) {

            if(_productListProvider.initialLoading){
              return CenteredProgressIndicator();
            }

            if(_productListProvider.products.isEmpty){
              return Center(child: Text('No products found'));
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(

                // refresh indicator add korte hbe

                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: _productListProvider.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.75,

                      ),
                      itemBuilder: (context, index) {
                        return FittedBox(child: ProductItem(product: _productListProvider.products[index]));
                      },
                    ),
                  ),
                  if(_productListProvider.loadingMore)
                    LinearProgressIndicator()


                ],
              ),
            );
          }
        ),
      ),
    );
  }
}

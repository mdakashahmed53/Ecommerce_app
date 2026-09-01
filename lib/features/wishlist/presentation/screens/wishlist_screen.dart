import 'package:ecommerce_app/features/shared/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/providers/main_nav_holder_provider.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key,});

  static const String name = '/wishlist';



  @override
  State<WishlistScreen> createState() =>
      _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,_){
        _backToHome();
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Wishlist'), leading: IconButton(onPressed: (){
          _backToHome();
        }, icon: Icon(Icons.arrow_back_ios)),),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return FittedBox(child: Icon(Icons.local_print_shop_outlined));
            },
          ),
        ),
      ),
    );
  }

  void _backToHome(){
    context.read<MainNavHolderProvider>().backToHome();
  }
}

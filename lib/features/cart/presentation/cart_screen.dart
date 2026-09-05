import 'package:ecommerce_app/features/cart/providers/cart_list_provider.dart';
import 'package:ecommerce_app/features/cart/widgets/cart_item.dart';
import 'package:ecommerce_app/features/cart/widgets/price_and_checkout_section.dart';
import 'package:ecommerce_app/features/shared/presentation/providers/main_nav_holder_provider.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/centered_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final CartListProvider _cartListProvider = CartListProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _cartListProvider.getCartList();
    });



  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
        onPopInvokedWithResult: (_,_){
          _backToHome();
        },
      child: ChangeNotifierProvider.value(
        value: _cartListProvider,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
          ),
          body: Consumer<CartListProvider>(
            builder: (context, _ ,_) {

              if(_cartListProvider.isLoading){
                return CenteredProgressIndicator();
              }
              if(_cartListProvider.errorMessage != null){
                return Center(child: Text(_cartListProvider.errorMessage!),);
              }

              if(_cartListProvider.cartList.isEmpty){
                return Center(child: Text('No items in cart'),);
              }

              return Column(
                children: [
                 Expanded(child: ListView.builder(

                     itemCount: _cartListProvider.cartList.length,
                     itemBuilder: (context, index){
                       return CartItem(cartModel: _cartListProvider.cartList[index],);
                     }

                 )),
                 PriceAndCheckOutSection(),
                ],
              );
            }
          ),
        ),
      ),
    );
  }

  void _backToHome(){
    context.read<MainNavHolderProvider>().backToHome();
  }
}

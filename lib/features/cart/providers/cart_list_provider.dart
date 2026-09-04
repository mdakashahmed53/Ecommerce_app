import 'package:ecommerce_app/app/get_network_caller.dart';
import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartListProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  List<CartModel> _cartList = [];

  List<CartModel> get cartList => _cartList;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _isLoading = true;
    notifyListeners();

    final response = await getNetworkCaller().getRequest(Urls.cartListUrls);

    if(response.isSuccess){
      _cartList = (response.body['data']['results'] as List).map((e) => CartModel.fromJson(e)).toList();
      isSuccess = true;
      _errorMessage = null;
    }else{
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }


    return isSuccess;
  }

  double totalPrice(){
    double total = 0;
    for(var item in _cartList){
      total += item.product.currentPrice * item.quantity;
    }
    return total;
  }


  void increaseProductQuantity(String productId, int quantity){
    for(var item in _cartList){
      if(item.product.id == productId){
        item.quantity = quantity;
        break;
      }
    }
    notifyListeners();
  }



}




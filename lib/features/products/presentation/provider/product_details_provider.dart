import 'package:ecommerce_app/features/products/data/product_details_model.dart';
import 'package:flutter/material.dart';
import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';

class ProductDetailsProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  ProductDetailsModel? _productDetails;

  ProductDetailsModel get productDetails => _productDetails!;

  Future<void> getProductDetails(String productId) async {
    _isLoading = true;
    _errorMessage = null;
    _productDetails = null;
    notifyListeners();

    final response = await getNetworkCaller().getRequest(
      Urls.getProductDetailsUrl(productId),
    );

    if(response.isSuccess){
      _productDetails = ProductDetailsModel.fromJson(response.body['data']);
    } else {
      _errorMessage = response.errorMessage;
    }

    _isLoading = false;
    notifyListeners();

  }
}

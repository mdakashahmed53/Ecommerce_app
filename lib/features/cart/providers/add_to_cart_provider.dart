import 'package:flutter/material.dart';

import '../../../app/get_network_caller.dart';
import '../../../app/urls.dart';
import '../data/models/add_to_cart_prams.dart';

class AddToCartProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> addToCart(AddToCartPrams prams) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final response = await getNetworkCaller().postRequest(
      Urls.addToCartUrl,
      body: prams.toJson(),

    );
    _isLoading = false;
    if (response.isSuccess) {
      notifyListeners();

      return true;
    } else {
      _errorMessage = response.errorMessage;
      notifyListeners();

      return false;
    }
  }
}

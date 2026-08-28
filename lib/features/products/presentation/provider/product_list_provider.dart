import 'package:flutter/material.dart';
import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../data/product_model.dart';

class ProductListProvider extends ChangeNotifier {
  int _pageNumber = 0;
  final int _pageSize = 15;
  int? _lastPage;

  bool _initialLoading = false;
  bool get initialLoading => _initialLoading;

  bool _loadingMore = false;
  bool get loadingMore => _loadingMore;

  final List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> getProductListByCategory(String categoryId) async {
    _pageNumber++;


    if (_lastPage != null && _pageNumber > _lastPage!) {
      return;
    }

    if (_isInitialLoading) {
      _initialLoading = true;
    } else {
      _loadingMore = true;
    }
    notifyListeners();

    final response = await getNetworkCaller().getRequest(
      Urls.getProductListByCategoryUrl(categoryId, _pageNumber, _pageSize),
    );

    if (response.isSuccess) {
      _lastPage ??= response.body['data']['last_page'];

      List<ProductModel> newProducts = [];
      for (var productJson in response.body['data']['results']) {
        newProducts.add(ProductModel.fromJson(productJson));
      }

      _products.addAll(newProducts);
    } else {
      _errorMessage = response.errorMessage;
    }

    if (_isInitialLoading) {
      _initialLoading = false;
    } else {
      _loadingMore = false;
    }

    notifyListeners();
  }

  bool get _isInitialLoading => _pageNumber == 1;

  bool get isLoading => _initialLoading || _loadingMore;

  void refreshProductList(String categoryId) {
    _pageNumber = 0;
    _lastPage = null;
    _products.clear();
    _errorMessage = null;
    getProductListByCategory(categoryId);
  }
}

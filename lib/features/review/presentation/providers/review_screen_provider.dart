import 'package:ecommerce_app/features/review/data/models/review_model.dart';
import 'package:flutter/material.dart';
import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';

class ReviewListProvider extends ChangeNotifier {
  int _pageNumber = 0;
  final int _pageSize = 10;
  int? _lastPage;

  bool _initialLoading = false;
  bool get initialLoading => _initialLoading;

  bool _loadingMore = false;
  bool get loadingMore => _loadingMore;

  final List<ReviewModel> _review = [];
  List<ReviewModel> get review => _review;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> getReviewListByProduct(String productId) async {
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
      Urls.getReviewListUrl(productId, _pageSize, _pageNumber)
    );

    if (response.isSuccess) {
      _lastPage ??= response.body['data']['last_page'];

      List<ReviewModel> newReview = [];
      for (var reviewJson in response.body['data']['results']) {
        newReview.add(ReviewModel.fromJson(reviewJson));
      }

      _review.addAll(newReview);
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

  void refreshProductList(String productId) {
    _pageNumber = 0;
    _lastPage = null;
    _review.clear();
    _errorMessage = null;
    getReviewListByProduct(productId);
  }
}

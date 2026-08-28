
import 'package:flutter/material.dart';

import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../data/category_model.dart';

class CategoryListProvider extends ChangeNotifier {
  int _pageNumber = 0;

  final int _pageSize = 28;

  int? _lastPage;

  bool _initialLoading = false;

  bool get initialLoading => _initialLoading;

  bool _loadingMore = false;
  bool get loadingMore => _loadingMore;

  final List<CategoryModel> _category = [];

  List<CategoryModel> get category => _category;

  String? _errorMessage;
  String? get errorMessage =>_errorMessage;


  Future<void>getCategoryList()async{
    _pageNumber ++;


    if((_lastPage == null || _pageNumber <= _lastPage!) == false){
      return ;
    }

    if(_isInitialLoading){
      _initialLoading = true;
    }else {
      _loadingMore = true;
    }
    notifyListeners();

    final response = await getNetworkCaller().getRequest(Urls.getCategoryListUrl(_pageNumber, _pageSize));

    if(response.isSuccess){
      // if(_lastPage == null){
      //   _lastPage = response.body['data']['last_page'];
      // }

      _lastPage ??= response.body['data']['last_page'];

      List<CategoryModel> newCategory = [];

      for(var category in response.body['data']['results']){
        newCategory.add(CategoryModel.fromJson(category));
      }

      _category.addAll(newCategory);

    }else {
      _errorMessage = response.errorMessage;
    }

    if(_isInitialLoading){
      _initialLoading = false;
    }else{
      _loadingMore = false;
    }

    notifyListeners();



  }

  bool get _isInitialLoading => _pageNumber ==1;

  bool get isLoading => _initialLoading || _loadingMore;


  void refreshCategoryList(){
    _pageNumber = 0;
    _category.clear();
    getCategoryList();
  }










}
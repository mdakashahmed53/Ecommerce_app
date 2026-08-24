import 'package:ecommerce_app/app/get_network_caller.dart';
import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/features/home/presentation/data/models/slider_model.dart';
import 'package:flutter/material.dart';

class HomeSliderProvider extends ChangeNotifier {
  bool _getHomeSliderProgress = false;
  bool get getHomeSliderProgress => _getHomeSliderProgress;

  List<SliderModel> _slider = [];

  List<SliderModel> get slide => _slider;

  String ? _errorMassage ;

  String? get errorMassage => _errorMassage;

  Future<bool> getHomeSlider()async{
    bool isSuccess = false;
    _getHomeSliderProgress = true;
    notifyListeners();

    final response = await getNetworkCaller().getRequest(Urls.homeSliderUrls);

    if(response.isSuccess){
      List<SliderModel> list = [];
      for (var item in response.body['data']['results']){
        list.add(SliderModel.fromJson(item));
      }

      _slider = list;

      isSuccess = true;
      _errorMassage = null;

    } else {
      _errorMassage = response.errorMessage;
    }
    _getHomeSliderProgress = false;
    notifyListeners();
    return isSuccess;
  }


}
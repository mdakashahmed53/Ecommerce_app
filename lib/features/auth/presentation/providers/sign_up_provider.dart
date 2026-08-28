import 'package:ecommerce_app/app/get_network_caller.dart';
import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/core/services/network_caller.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_up_prams.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  bool _signUpProgress = false;

  bool get signUpProgress => _signUpProgress;

  String? _errorMessage;

  String? get errorMassage => _errorMessage;

  Future<bool> signUp(SignUpPrams prams) async {
    bool isSuccess = false;
    _signUpProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.signUpUrl,
      body: prams.toJson(),
    );

    if(response.isSuccess){

      isSuccess = true;
      _errorMessage = null;
    }else {
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }

    _signUpProgress = false;
    notifyListeners();

    return isSuccess;
  }
}

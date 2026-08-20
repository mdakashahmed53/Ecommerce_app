import 'package:ecommerce_app/app/get_network_caller.dart';
import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/core/services/network_caller.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_in_prams.dart';
import 'package:flutter/material.dart';

class SingInProvider extends ChangeNotifier {
  bool _signInProgress = false;

  bool get signInProgress => _signInProgress;

  String? _errorMessage;
  String get errorMessage => _errorMessage!;

  Future<bool> singIn(SignInPrams prams) async {
    bool isSuccess = false;
    _signInProgress = true;
    notifyListeners();

    NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.signInUrl,
      body: prams.toJson(),
    );

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      isSuccess = true;
      _errorMessage = response.errorMessage;
    }

    _signInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}

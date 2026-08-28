import 'package:ecommerce_app/app/get_network_caller.dart';
import 'package:ecommerce_app/app/providers/auth_controller.dart';
import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/core/services/network_caller.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_in_prams.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
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
      String token = response.body['data']['token'];
      UserModel user = UserModel.fromJson(response.body['data']['user']);

      await AuthController.saveUserData(token, user);

      isSuccess = true;
      _errorMessage = null;
    } else {
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }

    _signInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}

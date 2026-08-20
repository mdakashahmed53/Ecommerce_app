import 'package:ecommerce_app/app/get_network_caller.dart';
import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/core/services/network_caller.dart';
import 'package:ecommerce_app/features/auth/data/models/verify_otp_prams.dart';
import 'package:flutter/material.dart';

class VeifyOtpProvider extends ChangeNotifier {
  bool _verifyOtpProgress = false;
  bool get verifyOtpProgress => _verifyOtpProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> verifyOtp(VerifyOtpPrams prams) async {
    bool isSuccess = false;
    _verifyOtpProgress = true;
    notifyListeners();

    NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.verifyOtpUrl,
      body: prams.toJson(),
    );

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }

    _verifyOtpProgress = false;
    notifyListeners();

    return isSuccess;
  }
}

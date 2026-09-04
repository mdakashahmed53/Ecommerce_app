
import 'package:ecommerce_app/app/providers/auth_controller.dart';
import 'package:flutter/material.dart';

import '../core/services/network_caller.dart';
import '../features/auth/presentation/screens/sign_in_screen.dart';
import 'ecommerce_app.dart';

NetworkCaller getNetworkCaller(){
  return NetworkCaller(headers: () => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    if(AuthController.accessToken != null) 'token': AuthController.accessToken!,
  }, onUnauthorized: () async {
    await AuthController.clearUserData();

    Navigator.pushNamed(EcommerceApp.navigatorKey.currentContext!, SignInScreen.name);

  });
}
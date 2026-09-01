import 'package:ecommerce_app/app/providers/auth_controller.dart';
import 'package:ecommerce_app/core/services/network_caller.dart';

NetworkCaller getNetworkCaller(){
  return NetworkCaller(headers: () => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    if(AuthController.accessToken != null) 'token': AuthController.accessToken!,
  });
}
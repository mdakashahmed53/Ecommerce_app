import 'package:ecommerce_app/core/services/network_caller.dart';

NetworkCaller getNetworkCaller(){
  return NetworkCaller(headers: () => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  });
}
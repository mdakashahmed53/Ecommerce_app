
import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

part 'network_response.dart';

class NetworkCaller {
  Logger _logger = Logger();

  final Map<String, String> Function() headers;

  NetworkCaller({required this.headers});


  // api get request
  Future<NetworkResponse> getRequest(String url) async {
    // Uri uri = Uri.parse(url);
    try {
      Response response = await get(Uri.parse(url), headers: headers());
      _logRequest(url);
      final decodeJson = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _logResponse(response);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodeJson,
        );
      } else {
        _logResponse(response,isError: true);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodeJson['msg'],
        );
      }
    } catch (e) {
      _logger.e('''URL => $url
      Message => ${e.toString()}''');
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  // api post request
  Future<NetworkResponse> postRequest(String url,  {required Map<String, dynamic> body}) async {
    // Uri uri = Uri.parse(url);
    try {
      Response response = await post(Uri.parse(url,), body: jsonEncode(body), headers: headers());
      _logRequest(url);


      final decodeJson = jsonDecode(response.body);


      if (response.statusCode == 200 || response.statusCode == 201) {
        _logResponse(response);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodeJson,
        );
      } else {
        _logResponse(response, isError: true);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodeJson['msg'],
        );
      }
    } catch (e) {
      _logger.e('''URL => $url
      Message => ${e.toString()}''');
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }



    // url log request
  void _logRequest(String url) {
    _logger.i("Request URL: $url");
  }
  // log response request
  void _logResponse(Response response, {bool isError = false}) {
    if (isError) {
      _logger.e('''URL => ${response.request!.url}
      Status Code => ${response.statusCode}
      Headers => ${response.headers}
      Body => ${response.body} ''');
    } else {
      _logger.i('''URL => ${response.request!.url}
      Status Code => ${response.statusCode}
      Headers => ${response.headers}
      Body => ${response.body} ''');
    }
  }
}


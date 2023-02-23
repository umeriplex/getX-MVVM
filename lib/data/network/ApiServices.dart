import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_x_mvvm/data/exceptions/AppExceptions.dart';
import 'package:http/http.dart' as http;
import 'base_api_services.dart';

class ApiServices extends BaseApiServices{

  @override
  Future<dynamic> getApi(String url) async{

    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson ;
    try {
      final response = await http.get(Uri.parse(url)).timeout( const Duration(seconds: 10));
      responseJson  = returnResponse(response) ;
    }on SocketException {
      throw NoInternetException('');
    }on RequestTimeoutException {
      throw RequestTimeoutException('');

    }
    print(responseJson);
    return responseJson ;

  }

  @override
  Future<dynamic> postApi(data, String url) async{
    if (kDebugMode) {
      debugPrint("API HIT ON => $url");
      debugPrint("API REQUEST DATA => $data");
    }
    dynamic responseJson ;
    try {
      final response = await http.post(Uri.parse(url),
          body: data
      ).timeout( const Duration(seconds: 10));
      responseJson  = returnResponse(response) ;
    }on SocketException {
      throw NoInternetException('');
    }on RequestTimeoutException {
      throw RequestTimeoutException('');

    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson ;

  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException("${response.body} Status Code: ${response.statusCode}");
      case 401:
      case 403:
      case 302:
        throw UnauthorisedException("${response.body} Status Code: ${response.statusCode}");
      case 500:
      default:
        throw FetchDataException("${response.body} Status Code: ${response.statusCode}");
    }
  }

}
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get_x_mvvm/data/exceptions/AppExceptions.dart';

import '../../res/AppConstants.dart';
import 'BaseApiServices.dart';
import 'package:http/http.dart' as http;

class ApiServices extends BaseApiServices{

  @override
  Future getAPI(String url) async {
    debugPrint("GET API HIT USING THIS URL ==> $url");
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: AppConstants.apiTimeOut));
      responseJson = returnResponse(response);
    } on SocketException{
      throw NoInternetException('');
    } on TimeoutException{
      throw RequestTimeoutException('');
    } on HttpException{
      throw BadRequestException('');
    } on FormatException{
      throw FetchDataException('');
    } on Exception{
      throw UnauthorisedException('');
    }
    return responseJson;
  }

  @override
  Future postAPI(String url, var body) async {
    debugPrint("POST API HIT USING THIS URL ==> $url" " AND BODY ==> $body");
    dynamic responseJson;
    try{
      final response = await http.post(
          Uri.parse(url),
          body: jsonEncode(body)  // todo agar raw form mai data hoga to jsoonEncode karenge, warna nahi
      ).timeout(const Duration(seconds: AppConstants.apiTimeOut));
      responseJson = returnResponse(response);
    } on SocketException{
      throw NoInternetException('');
    } on TimeoutException{
      throw RequestTimeoutException('');
    } on HttpException{
      throw BadRequestException('');
    } on FormatException{
      throw FetchDataException('');
    } on Exception{
      throw UnauthorisedException('');
    }
    return responseJson;
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
        throw UnauthorisedException("${response.body} Status Code: ${response.statusCode}");
      case 500:
      default:
        throw FetchDataException("${response.body} Status Code: ${response.statusCode}");
    }
  }
}
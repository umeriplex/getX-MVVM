

import 'dart:ui';

import 'package:get_x_mvvm/data/network/ApiServices.dart';

import '../../res/app_url/app_url.dart';


class LoginRepository {

  final _apiService  = ApiServices() ;


  Future<dynamic> loginApi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.loginApi);
    return response ;
  }



}


import 'dart:ui';

import 'package:get_x_mvvm/data/network/ApiServices.dart';

import '../../models/home/user_list_model.dart';
import '../../res/app_url/app_url.dart';


class HomeRepository {

  final _apiService  = ApiServices() ;

  Future<UserListModel> userListApi() async{
    dynamic response = await _apiService.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response) ;
  }


}
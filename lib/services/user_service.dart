import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mentalassessment/model/userinfomation_model.dart';
import 'package:mentalassessment/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/serverinfo.dart';

class UserService {
  static Future<UserInformation> avatarUser(String email) async {
    await AuthService.fetchToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final dio = Dio();
    Response response = await dio.get(
      //for dev
      (Platform.isAndroid)
          ? "${Serverinfo.usersAvatar}/$email"
          : Serverinfo.login,
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
    );
    return UserInformation(
      email: response.data['result'].first['email'] ?? '',
      avatar: response.data['result'].first['avatar'] ?? '',
    );
  }
}

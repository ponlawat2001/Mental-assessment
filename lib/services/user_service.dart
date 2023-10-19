import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/serverinfo.dart';

class UserService {
  static avatarUser(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final dio = Dio();
    print("${Serverinfo.usersAvatar}/$email");
    Response response = await dio.get(
      //for dev
      (Platform.isAndroid)
          ? "${Serverinfo.usersAvatar}/$email"
          : Serverinfo.login,
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
    );
    print(response.data);
    return response.data;
  }
}

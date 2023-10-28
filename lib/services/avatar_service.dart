import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mentalassessment/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/serverinfo.dart';
import '../model/avatar_model.dart';

class AvatarService {
  static Future<AvatarResult> avatarUser(String email) async {
    await AuthService.fetchToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final dio = Dio();
    Response response = await dio.get(
      //for dev
      (Platform.isAndroid) ? "${Serverinfo.avatar}/$email" : Serverinfo.login,
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
    );
    print(response.data);
    return AvatarResult(
      id: response.data['result'].first['id'] ?? '',
      email: response.data['result'].first['email'] ?? '',
      avatar: response.data['result'].first['avatar'] ?? '',
    );
  }
}

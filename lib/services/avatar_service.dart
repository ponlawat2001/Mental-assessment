import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/instance_manager.dart';
import 'package:mentalassessment/controllers/avatar_controller.dart';
import 'package:mentalassessment/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/serverinfo.dart';
import '../model/avatar/avatar_model.dart';

class AvatarService {
  static fetchAvatar() async {
    final avatarController = Get.put(AvatarController());
    String email = FirebaseAuth.instance.currentUser?.email ?? ':email';
    await AuthService.fetchToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final dio = Dio();
    Response response = await dio.get(
      //for dev
      (Platform.isAndroid)
          ? "${Serverinfo.avatarfindOne}/$email"
          : Serverinfo.login,
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
    );
    avatarController.setAvatars(AvatarResult(
      id: response.data['result'].first['id'] ?? '',
      email: response.data['result'].first['email'] ?? '',
      avatar: response.data['result'].first['avatar'] ?? '',
    ));
  }

  static createAvatar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final dio = Dio();
    await dio.post(
        //for dev
        (Platform.isAndroid) ? Serverinfo.avatarcreate : Serverinfo.login,
        options: Options(
            contentType: 'application/json',
            headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
        data: {
          "email": FirebaseAuth.instance.currentUser!.email,
          "avatar": "female01",
        });
  }
}

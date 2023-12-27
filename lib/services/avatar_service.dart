import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/instance_manager.dart';
import 'package:mentalassessment/controllers/avatar_controller.dart';
import 'package:mentalassessment/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/serverinfo.dart';
import '../model/avatar/avatar_model.dart';
import '../views/widgets/alert_dialog.dart';

class AvatarService {
  static fetchAvatar() async {
    final avatarController = Get.put(AvatarController());
    String email = FirebaseAuth.instance.currentUser?.email ?? ':email';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final dio = Dio();
    Response response = await dio
        .get(
      //for dev
      (Platform.isAndroid)
          ? "${Serverinfo.avatarfindOne}/$email"
          : Serverinfo.login,
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
    )
        .catchError((e) async {
      await AuthService.fetchToken();
      return fetchAvatar();
    });
    avatarController.setAvatars(AvatarResult(
      id: response.data['result'].first['id'] ?? '',
      email: response.data['result'].first['email'] ?? '',
      avatar: response.data['result'].first['avatar'] ?? '',
    ));
  }

  static updateAvatar(context, AvatarResult data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final dio = Dio();
    AlertDialogselect.loadingDialog(context);
    await dio.put(
      //for dev
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
      Serverinfo.register,
      data: {
        'avatar': data.avatar,
      },
    ).catchError((e) async {
      Navigator.pop(context);
      await AuthService.fetchToken();
      return await updateAvatar(context, data);
    });
    fetchAvatar();
    Navigator.pop(context);
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

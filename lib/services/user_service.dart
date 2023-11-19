import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentalassessment/model/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/serverinfo.dart';
import '../views/widgets/alert_dialog.dart';
import 'auth_service.dart';

class UserService {
  static update(context, UserResult data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final dio = Dio();
    if (!context.mounted) return;
    AlertDialogselect.loadingDialog(context);
    await dio.put(
      //for dev
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
      (Platform.isAndroid)
          ? '${Serverinfo.userupdate}/${FirebaseAuth.instance.currentUser!.uid}'
          : Serverinfo.registeAndroid,
      data: {
        'phone': data.phone,
        'displayname': data.displayname,
      },
    ).catchError((e) async {
      await AuthService.fetchToken();
      return await update(context, data);
    });
    FirebaseAuth.instance.currentUser!.reload();

    Navigator.pop(context);
  }
}

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:mentalassessment/constants/serverinfo.dart';
import 'package:mentalassessment/controllers/vent_controller.dart';
import 'package:mentalassessment/model/vent/vent_%20model.dart';
import 'package:mentalassessment/model/vent/ventchoice_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/widgets/alert_dialog.dart';
import 'auth_service.dart';

class VentService {
  static fetchVent(String? email) async {
    final ventController = Get.put(VentController());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    Response res = await dio
        .get(
      '${Serverinfo.ventfindemail}/$email',
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
    )
        .catchError((e) async {
      await AuthService.fetchToken();
      return await fetchVent(email);
    });
    ventController.setVentlist(
      VentModel(
        message: res.data['message'],
        result: res.data['result']
            .map<VentResult>((e) => VentResult.fromJson(e))
            .toList(),
      ),
    );
  }

  static createVent(String data, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    AlertDialogselect.loadingDialog(context);
    await dio.post(Serverinfo.ventcreate,
        options: Options(
            contentType: 'application/json',
            headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
        data: {
          "vent_content": data,
          "owner": FirebaseAuth.instance.currentUser!.email
        }).catchError(
      (e) async {
        Navigator.pop(context);
        await AuthService.fetchToken();
        return await createVent(data, context);
      },
    );
    Navigator.pop(context);
    AlertDialogselect.ventThankDialog(context);
  }

  static updateVent(String id, String ventcontent, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    AlertDialogselect.loadingDialog(context);
    await dio.put('${Serverinfo.ventupdate}/$id',
        options: Options(
            contentType: 'application/json',
            headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
        data: {
          "vent_content": ventcontent,
        }).catchError(
      (e) async {
        Navigator.pop(context);
        await AuthService.fetchToken();
        return await updateVent(id, ventcontent, context);
      },
    );
    VentService.fetchVent(FirebaseAuth.instance.currentUser!.email);
    Navigator.pop(context);
  }

  static deleteVent(String id, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    AlertDialogselect.loadingDialog(context);
    await dio.put('${Serverinfo.ventdelete}/$id',
        options: Options(
            contentType: 'application/json',
            headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
        data: {
          "is_delete": true,
        }).catchError(
      (e) async {
        Navigator.pop(context);
        await AuthService.fetchToken();
        return await deleteVent(id, context);
      },
    );
    VentService.fetchVent(FirebaseAuth.instance.currentUser!.email);
    Navigator.pop(context);
  }

  static fetchVentChoice() async {
    final ventChoiceController = Get.put(VentController());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    Response res = await dio
        .get(
      Serverinfo.ventchiocefind,
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
    )
        .catchError((e) async {
      print(e);
      await AuthService.fetchToken();
      return await fetchVentChoice();
    });
    ventChoiceController.setVentChoicelist(
      VentChoiceModel(
        message: res.data['message'],
        result: res.data['result']
            .map<VentChoiceResult>((e) => VentChoiceResult.fromJson(e))
            .toList(),
      ),
    );
  }
}

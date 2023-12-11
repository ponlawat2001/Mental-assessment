import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:mentalassessment/constants/serverinfo.dart';
import 'package:mentalassessment/controllers/vent_controller.dart';
import 'package:mentalassessment/model/vent/vent_%20model.dart';
import 'package:mentalassessment/model/vent/ventchoice_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/vent/ventaudio_model.dart';
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

  static fetchVentaudio(String? email) async {
    final ventController = Get.put(VentController());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    Response res = await dio
        .get(
      '${Serverinfo.audiofindOwner}/$email',
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
    )
        .catchError((e) async {
      await AuthService.fetchToken();
      return await fetchVentaudio(email);
    });
    ventController.setVentAudiolist(
      VentAudioModel(
        message: res.data['message'],
        result: res.data['result']
            .map<VentAudioResult>((e) => VentAudioResult.fromJson(e))
            .toList(),
      ),
    );
  }

  static upload(String filePath, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    AlertDialogselect.loadingDialog(context);
    print(filePath);
    String fileName = filePath.split('/').last;

    try {
      FormData formData = FormData.fromMap({
        'audio': await MultipartFile.fromFile(filePath, filename: fileName),
      });
      // uploadaudio
      Response res = await dio.post(
        Serverinfo.storageaudio,
        data: formData,
        options: Options(
            contentType: "multipart/form-data",
            headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
      );
      print('File Upload Response: ${res.data['result'][0]}');
      Response finalres = await dio.post(
        Serverinfo.audiocreate,
        data: VentAudioResult(
            owner: FirebaseAuth.instance.currentUser!.email,
            audioUrl: res.data['result'][0]),
        options: Options(
            contentType: 'application/json',
            headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
      );
      print('Final Response: ${finalres.data}');
    } catch (error) {
      print('Error uploading file: $error');
    }
    Navigator.pop(context);
    Navigator.pop(context);
    AlertDialogselect.ventThankDialog(context);
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

  static deleteVentRecord(String id, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    AlertDialogselect.loadingDialog(context);
    await dio.put('${Serverinfo.audiodelete}/$id',
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
    VentService.fetchVentaudio(FirebaseAuth.instance.currentUser!.email);
    Navigator.pop(context);
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

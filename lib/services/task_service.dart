import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/instance_manager.dart';
import 'package:mentalassessment/constants/serverinfo.dart';
import 'package:mentalassessment/controllers/task_controller.dart';
import 'package:mentalassessment/model/assessment/assessment_model.dart';
import 'package:mentalassessment/model/assessment/history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/widgets/alert_dialog.dart';
import 'auth_service.dart';

class TaskService {
  static fetchTask() async {
    final taskController = Get.put(TaskController());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    String? owner = FirebaseAuth.instance.currentUser!.email;
    Response res = await dio
        .get(
      '${Serverinfo.taskfindOwner}/$owner',
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
    )
        .catchError((e) async {
      await AuthService.fetchToken();
      return await fetchTask();
    });
    taskController.settask(res.data['result']
        .map<HistoryResult>((e) => HistoryResult.fromJson(e))
        .toList());
  }

  static updateTask(Summary data, String taskId, context) async {
    AlertDialogselect.loadingDialog(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    Response res = await dio
        .get(
      '${Serverinfo.taskfindOne}/$taskId',
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
    )
        .catchError((e) async {
      await AuthService.fetchToken();
      return await updateTask(data, taskId, context);
    });

    List<HistoryResult> temp = res.data['result']
        .map<HistoryResult>((e) => HistoryResult.fromJson(e))
        .toList();
    List<Summary> finalsummary = temp.first.summary!
        .where((element) => element.name != data.name)
        .toList();
    finalsummary.insert(0, data);
    print(jsonEncode(finalsummary));
    await dio.put(
      '${Serverinfo.taskupdate}/$taskId',
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
      data: {"summary": finalsummary},
    ).catchError((e) async {
      await AuthService.fetchToken();
      return await updateTask(data, taskId, context);
    });
  }

  static createTask(List<AssessmentResult> data, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    AlertDialogselect.loadingDialog(context);
    await dio.post(Serverinfo.taskcreate,
        options: Options(
            contentType: 'application/json',
            headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
        data: {
          "type": "main",
          "owner": FirebaseAuth.instance.currentUser!.email,
          "summary": data
              .map((e) => {
                    "name": e.name,
                    "useranswer": [],
                    "scorerate": [],
                    "advise": ""
                  })
              .toList()
        }).then((res) {
      prefs.setString('createTaskId', res.data['result']['id']);
      print(
        prefs.get('createTaskId'),
      );
    }).catchError(
      (e) async {
        Navigator.pop(context);
        await AuthService.fetchToken();
        return await createTask(data, context);
      },
    );
    fetchTask();
    Navigator.pop(context);
  }

  static deleteTask(String id, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    AlertDialogselect.loadingDialog(context);

    await dio
        .delete(
      '${Serverinfo.taskdelete}/$id',
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
    )
        .catchError((e) async {
      await AuthService.fetchToken();
      return await fetchTask();
    });
    fetchTask();
    Navigator.pop(context);
  }
}

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:mentalassessment/constants/serverinfo.dart';
import 'package:mentalassessment/controllers/vent_controller.dart';
import 'package:mentalassessment/model/vent/vent_%20model.dart';
import 'package:mentalassessment/model/vent/ventchoice_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_service.dart';

class VentService {
  static fetchVent() async {
    final ventController = Get.put(VentController());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    Response res = await dio
        .get(
      Serverinfo.ventfind,
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
    )
        .catchError((e) async {
      print(e);
      await AuthService.fetchToken();
      return await fetchVent();
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
      return await fetchVent();
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

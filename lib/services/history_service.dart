import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/instance_manager.dart';
import 'package:mentalassessment/constants/serverinfo.dart';
import 'package:mentalassessment/controllers/history_controller.dart';
import 'package:mentalassessment/model/assessment/history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_service.dart';

class HistoryService {
  static fetchHistory() async {
    final historyController = Get.put(HistoryController());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    String? owner = FirebaseAuth.instance.currentUser!.email;
    Response res = await dio
        .get(
      '${Serverinfo.historyfindOwner}/$owner',
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
    )
        .catchError((e) async {
      await AuthService.fetchToken();
      return await fetchHistory();
    });
    historyController.sethistorylist(res.data['result']
        .map<HistoryResult>((e) => HistoryResult.fromJson(e))
        .toList());
  }
}

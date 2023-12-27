import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:mentalassessment/constants/serverinfo.dart';
import 'package:mentalassessment/controllers/assessment_controller.dart';
import 'package:mentalassessment/model/assessment/assessment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_service.dart';

class AssessmentService {
  static fetchAssessment() async {
    final assessmentController = Get.put(AssessmentController());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    Response res = await dio
        .get(
      Serverinfo.assessmentfindMain,
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
    )
        .catchError((e) async {
      await AuthService.fetchToken();
      return await fetchAssessment();
    });
    assessmentController.setcontactlist(res.data['result']
        .map<AssessmentResult>((e) => AssessmentResult.fromJson(e))
        .toList());
  }
}

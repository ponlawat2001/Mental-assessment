import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:mentalassessment/controllers/contact_controller.dart';
import 'package:mentalassessment/model/contact/contact_model.dart';
import 'package:mentalassessment/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/serverinfo.dart';

class ContactService {
  static fetchContact() async {
    final contactController = Get.put(ContactController());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final dio = Dio();
    Response response = await dio
        .get(
      //for dev
      (Platform.isAndroid) ? Serverinfo.contactfindAll : Serverinfo.login,
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
    )
        .catchError((e) async {
      await AuthService.fetchToken();
      return fetchContact();
    });
    contactController.setcontactlist(ContactResult(
      id: response.data['result'].first['id'] ?? '',
      nameContact: response.data['result'].first['name_contact'] ?? '',
      imageContact: response.data['result'].first['image_contact'] ?? '',
      locationContact: response.data['result'].first['location_contact'] ?? '',
      emailContact: response.data['result'].first['email_contact'] ?? '',
      lineContact: response.data['result'].first['line_contact'] ?? '',
      facebookContact: response.data['result'].first['facebook_contact'] ?? '',
      phoneContact: response.data['result'].first['phone_contact'] ?? '',
      updateAt: response.data['result'].first['update_at'] ?? '',
    ));
  }
}

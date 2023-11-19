import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:mentalassessment/constants/serverinfo.dart';
import 'package:mentalassessment/controllers/news_controller.dart';
import 'package:mentalassessment/model/news/news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_service.dart';

class NewsService {
  static fetchNews() async {
    final newsController = Get.put(NewsController());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    Response res = await dio
        .get(
      Serverinfo.newsfind,
      options: Options(
          contentType: 'application/json',
          headers: {"Authorization": "Bearer ${prefs.get('token')}"}),
    )
        .catchError((e) async {
      await AuthService.fetchToken();
      return await fetchNews();
    });
    newsController.setNewslist(
      NewsModel(
        message: res.data['message'],
        result: res.data['result']
            .map<NewsResult>((e) => NewsResult.fromJson(e))
            .toList(),
      ),
    );
  }
}

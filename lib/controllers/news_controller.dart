import 'package:get/get.dart';
import 'package:mentalassessment/model/news/news_model.dart';

class NewsController extends GetxController {
  Rx<NewsModel> newslist = NewsModel().obs;

  setNewslist(NewsModel data) {
    newslist.value = data;
    update();
  }
}

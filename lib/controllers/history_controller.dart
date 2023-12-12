import 'package:get/get.dart';

import 'package:mentalassessment/model/assessment/history_model.dart';

class HistoryController extends GetxController {
  RxList<HistoryResult> history = [HistoryResult()].obs;

  setcontactlist(List<HistoryResult> data) {
    history.value = data;
    update();
  }
}

import 'package:get/get.dart';
import 'package:mentalassessment/model/assessment/history_model.dart';

class TaskController extends GetxController {
  RxList<HistoryResult> task = [HistoryResult()].obs;

  settask(List<HistoryResult> data) {
    task.value = data;
    update();
  }

  settaskbyindex(HistoryResult data, index) {
    task[index] = data;
    update();
  }
}

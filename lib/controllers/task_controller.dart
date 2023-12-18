import 'dart:convert';

import 'package:get/get.dart';
import 'package:mentalassessment/model/assessment/assessment_model.dart';
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

  RxList<Useranswer> answer = [Useranswer()].obs;

  pushAnswer(Questionnaire data, Answer useranswer) {
    answer.add(
      Useranswer(
        answer: useranswer.name,
        score: useranswer.score,
        question: data.title,
      ),
    );
    print(jsonEncode(answer));
  }

  clearAnswer() {
    answer.clear();
  }
}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:mentalassessment/model/assessment/assessment_model.dart'
    as assessmentModel;
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

  RxList<Useranswer> answer = <Useranswer>[].obs;

  pushAnswer(
      assessmentModel.Questionnaire data,
      MapEntry<int, assessmentModel.Answer> useranswer,
      List<assessmentModel.Answer>? answerrate) {
    int finalscore;
    print(data.reversescore);
    if (data.reversescore ?? false) {
      finalscore = answerrate!.reversed.toList()[useranswer.key].score ?? 0;
    } else {
      finalscore = useranswer.value.score ?? 0;
    }
    answer.add(
      Useranswer(
        answer: useranswer.value.name,
        score: finalscore,
        question: data.title,
      ),
    );
    print(jsonEncode(answer));
  }

  clearAnswer() {
    answer.clear();
  }
}

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
    List<assessmentModel.Answer>? answerrate,
    assessmentModel.AssessmentResult? assessmentData,
  ) {
    int finalscore;
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
        questionId: data.id,
      ),
    );
    print(answer.length);
    if (assessmentData!.questionnaire!.length == answer.length) {
      pushSummary(assessmentData, answer);
    }
  }

  clearAnswer() {
    answer.clear();
    print('answer clear!');
  }

  Rx<Summary> summary = Summary().obs;

  pushSummary(assessmentModel.AssessmentResult assessmentData,
      List<Useranswer> userAnswer) {
    summary.value = Summary(
      name: assessmentData.name,
      useranswer: userAnswer,
      totalscore: totalscore(userAnswer),
      scorerate: scorerate(assessmentData, userAnswer),
    );
    update();
  }

  int totalscore(List<Useranswer> answer) {
    int temp = 0;
    for (var element in answer) {
      temp += element.score ?? 0;
    }
    return temp;
  }

  List<Scorerate> scorerate(assessmentModel.AssessmentResult assessmentData,
      List<Useranswer> userAnswer) {
    List<Scorerate>? sumscorerate = <Scorerate>[];
    int score = 0;
    String rate = '';
    // print(jsonEncode(userAnswer));
    for (var e in assessmentData.scorerate!) {
      for (var element in userAnswer) {
        if (e.questionnairenumber!.contains(element.questionId)) {
          score += element.score ?? 99;
          print('score + ${element.score}');
        }
      }
      for (var einner in e.rate!.reversed) {
        if (einner.score! <= score) {
          print('score is $score');
          rate = einner.name!;
        }
      }
      sumscorerate.add(Scorerate(rate: rate, name: e.name));
    }
    print(jsonEncode(sumscorerate));
    print(rate);
    return sumscorerate;
  }
}

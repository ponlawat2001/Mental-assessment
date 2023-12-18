import 'package:get/get.dart';
import 'package:mentalassessment/model/assessment/assessment_model.dart';

class AssessmentController extends GetxController {
  RxList<AssessmentResult> assessment = <AssessmentResult>[].obs;

  setcontactlist(List<AssessmentResult> data) {
    assessment.value = data;
    update();
  }

  randomquestionlist(int index) {
    assessment[index].questionnaire!.shuffle();
  }
}

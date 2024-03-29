import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/controllers/assessment_controller.dart';
import 'package:mentalassessment/controllers/task_controller.dart';
import 'package:mentalassessment/model/assessment/assessment_model.dart';
import 'package:mentalassessment/model/assessment/history_model.dart';
import 'package:mentalassessment/services/history_service.dart';
import 'package:mentalassessment/services/task_service.dart';
import 'package:mentalassessment/views/widgets/alert_dialog.dart';
import 'package:mentalassessment/views/widgets/widgetLayout/layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/theme.dart';
import '../components/component.dart';

class AssessmentDetailScreen extends StatefulWidget {
  const AssessmentDetailScreen({super.key});

  @override
  State<AssessmentDetailScreen> createState() => _AssessmentDetailScreenState();
}

class _AssessmentDetailScreenState extends State<AssessmentDetailScreen> {
  final assessmentController = Get.put(AssessmentController());
  final taskController = Get.put(TaskController());

  double gap = 16;
  int counter = 1;
  bool isRandom = false;

  @override
  void initState() {
    super.initState();
    taskController.clearAnswer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  Layout body(BuildContext context) {
    final int args = (ModalRoute.of(context)?.settings.arguments ?? 0) as int;
    if (!isRandom) {
      assessmentController.randomquestionlist(args);
    }
    isRandom = true;
    return Layout(
      backgroundAsset: Assets.imageBackground2,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: GetX<AssessmentController>(
            init: AssessmentController(),
            builder: (AssessmentController controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: () {
                      if (counter > 1) {
                        AlertDialogselect.customDialog(
                            context,
                            'แน่ใจที่จะย้อนกลับ',
                            'หากย้อนกลับรายการประเมินจะไม่ถูกบันทึก',
                            const Icon(Icons.info),
                            true, () {
                          taskController.clearAnswer();
                          Navigator.pop(context);
                        });
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: ColorTheme.main5,
                    ),
                  ),
                  SizedBox(height: gap),
                  Text(
                    controller.assessment[args].name ?? 'Unknown',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: gap),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'เลือกตอบตามความรู้สึกนะ',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '$counter/${controller.assessment[args].questionnaire?.length ?? 0 - 1}',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Component.dividerhorizotal(),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: ColorTheme.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            '$counter. ${controller.assessment[args].questionnaire?[counter - 1].title ?? ''}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    color: ColorTheme.deleteMode,
                                    fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: gap),
                  controller.assessment[args].answer?.length ==
                              controller
                                  .assessment[args].questionnaire?.length &&
                          controller.assessment[args].answer![0].choices != null
                      ? choiceWhenqusetionown(
                          controller,
                          args,
                          counter - 1,
                          controller.assessment[args]
                                  .questionnaire?[counter - 1].id ??
                              0,
                          context)
                      : choiceWhenyesorno(controller, args, context)
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Wrap choiceWhenqusetionown(AssessmentController controller, int args,
      int index, int questionid, BuildContext context) {
    Answer temp = controller.assessment[args].answer!
        .firstWhere((element) => element.id == questionid);
    return Wrap(
      runSpacing: 16,
      spacing: 16,
      children: temp.choices!.asMap().entries.map((e) {
        return InkWell(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            //is mainAssessment
            if (prefs.getString('createTaskId') != null) {
              if (counter !=
                  controller.assessment[args].questionnaire!.length) {
                taskController.pushAnswer(
                    controller.assessment[args].questionnaire![counter - 1],
                    e,
                    controller.assessment[args].answer,
                    controller.assessment[args]);
              } else {
                //outofQ
                if (assessmentController.assessment.length == args + 1) {
                  taskController.pushAnswer(
                      controller.assessment[args].questionnaire![counter - 1],
                      e,
                      controller.assessment[args].answer,
                      controller.assessment[args]);
                  if (!context.mounted) return;
                  // update task to firestore
                  await TaskService.updateTask(taskController.summary.value,
                      prefs.getString('createTaskId')!, context);
                  if (!context.mounted) return;
                  AlertDialogselect.loadingDialog(context);
                  HistoryResult? res = await TaskService.findOne(
                      prefs.getString('createTaskId') ?? '');
                  HistoryService.createHistory(res).then((value) {
                    TaskService.deleteTask(
                        prefs.getString('createTaskId') ?? '', context);
                    Navigator.pushReplacementNamed(
                        context, '/assessmenthistorydetail',
                        arguments: value);
                  });
                } else {
                  taskController.pushAnswer(
                      controller.assessment[args].questionnaire![counter - 1],
                      e,
                      controller.assessment[args].answer,
                      controller.assessment[args]);
                  if (!context.mounted) return;
                  TaskService.updateTask(taskController.summary.value,
                      prefs.getString('createTaskId') ?? '', context);
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                      context, '/assessmentdescription',
                      arguments: args + 1);
                }
              }
              if (counter !=
                  controller.assessment[args].questionnaire!.length) {
                setState(() {
                  counter++;
                });
              }
            } else {
              //other assessement method
              if (counter !=
                  controller.assessment[args].questionnaire!.length) {
                taskController.pushAnswer(
                    controller.assessment[args].questionnaire![counter - 1],
                    e,
                    controller.assessment[args].answer,
                    controller.assessment[args]);
              } else {
                taskController.pushAnswer(
                    controller.assessment[args].questionnaire![counter - 1],
                    e,
                    controller.assessment[args].answer,
                    controller.assessment[args]);
                if (!context.mounted) return;
                AlertDialogselect.loadingDialog(context);
                await HistoryService.createHistory(HistoryResult(
                        owner: FirebaseAuth.instance.currentUser!.email,
                        summary: [taskController.summary.value],
                        type: 'other'))
                    .then((value) {
                  Navigator.pushReplacementNamed(
                      context, '/assessmenthistorydetail',
                      arguments: value);
                });
              }
              if (counter !=
                  controller.assessment[args].questionnaire!.length) {
                setState(() {
                  counter++;
                });
              }
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: ColorTheme.main30,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 2,
                      spreadRadius: 0,
                      color: ColorTheme.lightGray2),
                ]),
            padding: const EdgeInsets.all(16),
            child: Text(
              e.value.name ?? 'Unknown',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        );
      }).toList(),
    );
  }

  Wrap choiceWhenyesorno(
      AssessmentController controller, int args, BuildContext context) {
    return Wrap(
      runSpacing: 16,
      spacing: 16,
      children: controller.assessment[args].answer!.asMap().entries.map((e) {
        return InkWell(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            //is mainAssessment
            if (prefs.getString('createTaskId') != null) {
              if (counter !=
                  controller.assessment[args].questionnaire!.length) {
                taskController.pushAnswer(
                    controller.assessment[args].questionnaire![counter - 1],
                    e,
                    controller.assessment[args].answer,
                    controller.assessment[args]);
              } else {
                //outofQ
                if (assessmentController.assessment.length == args + 1) {
                  taskController.pushAnswer(
                      controller.assessment[args].questionnaire![counter - 1],
                      e,
                      controller.assessment[args].answer,
                      controller.assessment[args]);
                  if (!context.mounted) return;
                  // update task to firestore
                  await TaskService.updateTask(taskController.summary.value,
                      prefs.getString('createTaskId')!, context);
                  if (!context.mounted) return;
                  AlertDialogselect.loadingDialog(context);
                  HistoryResult? res = await TaskService.findOne(
                      prefs.getString('createTaskId') ?? '');
                  HistoryService.createHistory(res).then((value) {
                    TaskService.deleteTask(
                        prefs.getString('createTaskId') ?? '', context);
                    Navigator.pushReplacementNamed(
                        context, '/assessmenthistorydetail',
                        arguments: value);
                  });
                } else {
                  taskController.pushAnswer(
                      controller.assessment[args].questionnaire![counter - 1],
                      e,
                      controller.assessment[args].answer,
                      controller.assessment[args]);
                  if (!context.mounted) return;
                  TaskService.updateTask(taskController.summary.value,
                      prefs.getString('createTaskId') ?? '', context);
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                      context, '/assessmentdescription',
                      arguments: args + 1);
                }
              }
              if (counter !=
                  controller.assessment[args].questionnaire!.length) {
                setState(() {
                  counter++;
                });
              }
            } else {
              //other assessement method
              if (counter !=
                  controller.assessment[args].questionnaire!.length) {
                taskController.pushAnswer(
                    controller.assessment[args].questionnaire![counter - 1],
                    e,
                    controller.assessment[args].answer,
                    controller.assessment[args]);
              } else {
                taskController.pushAnswer(
                    controller.assessment[args].questionnaire![counter - 1],
                    e,
                    controller.assessment[args].answer,
                    controller.assessment[args]);
                if (!context.mounted) return;
                AlertDialogselect.loadingDialog(context);
                await HistoryService.createHistory(HistoryResult(
                        owner: FirebaseAuth.instance.currentUser!.email,
                        summary: [taskController.summary.value],
                        type: 'other'))
                    .then((value) {
                  Navigator.pushReplacementNamed(
                      context, '/assessmenthistorydetail',
                      arguments: value);
                });
              }
              if (counter !=
                  controller.assessment[args].questionnaire!.length) {
                setState(() {
                  counter++;
                });
              }
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: ColorTheme.main30,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 2,
                      spreadRadius: 0,
                      color: ColorTheme.lightGray2),
                ]),
            padding: const EdgeInsets.all(16),
            child: Text(
              e.value.name ?? 'Unknown',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        );
      }).toList(),
    );
  }
}

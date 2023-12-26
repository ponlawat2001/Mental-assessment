import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/controllers/task_controller.dart';
import 'package:mentalassessment/services/assessment_service.dart';
import 'package:mentalassessment/services/task_service.dart';
import 'package:mentalassessment/views/components/component.dart';
import 'package:mentalassessment/views/widgets/alert_dialog.dart';
import 'package:mentalassessment/views/widgets/widgetLayout/layout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/theme.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  double gap = 16;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      TaskService.fetchTask();
      AssessmentService.fetchAssessment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body());
  }

  body() => Layout(
        backgroundAsset: Assets.imageBackground2,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'แบบประเมิน',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                Text(
                  'เลือกได้เลยอยากลองทำแบบไหน',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w300),
                ),
                SizedBox(height: gap),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/assessmentmain');
                        },
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: ColorTheme.editIcon,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        child: Text(
                          'เริ่มทำแบบประเมินรวม',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: ColorTheme.main5),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/assessmentother');
                        },
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: ColorTheme.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        child: Text('เริ่มทำแบบประเมินอื่น',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: ColorTheme.main5)),
                      ),
                    )
                  ],
                ),
                SizedBox(height: gap),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/assessmenthistory');
                        },
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: ColorTheme.main30,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.iconClock,
                              colorFilter: ColorFilter.mode(
                                  ColorTheme.main5, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'ประวัติการประเมิน',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: ColorTheme.main5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Component.dividerhorizotal(),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: ColorTheme.lightGray2.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 0),
                          BoxShadow(
                            offset: const Offset(0, 4),
                            spreadRadius: 0,
                            blurRadius: 2,
                            color: ColorTheme.white.withOpacity(0.8),
                          ),
                        ]),
                    child: GetX<TaskController>(
                      init: TaskController(),
                      builder: (TaskController controller) {
                        return (controller.task.isEmpty)
                            ? const Text('เริ่มทำแบบประเมินเลยสิ!')
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: RefreshIndicator(
                                  onRefresh: () => TaskService.fetchTask(),
                                  color: ColorTheme.main10,
                                  child: ListView.separated(
                                    itemCount: controller.task.length,
                                    separatorBuilder: (context, _) =>
                                        SizedBox(height: gap),
                                    itemBuilder: (context, index) => Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          color: ColorTheme.white,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'แบบประเมินรวม',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        color:
                                                            ColorTheme.main5),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  await AlertDialogselect.customDialog(
                                                      context,
                                                      'ยืนยันที่จะยกเลิกทำแบบประเมิน',
                                                      'คูณจะต้องเริ่มต้นประเมินใหม่ยืนยันหรือไม่?',
                                                      SvgPicture.asset(
                                                          Assets.iconInfo),
                                                      true, () async {
                                                    await TaskService
                                                        .deleteTask(
                                                            controller
                                                                    .task[index]
                                                                    .id ??
                                                                '',
                                                            context);
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.close_outlined,
                                                  color: ColorTheme.validation,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 16),
                                          ListView.separated(
                                            shrinkWrap: true,
                                            physics:
                                                const ClampingScrollPhysics(),
                                            itemCount: controller.task[index]
                                                    .summary?.length ??
                                                0,
                                            separatorBuilder:
                                                (context, index) =>
                                                    SizedBox(height: gap),
                                            itemBuilder:
                                                (context, indexinner) =>
                                                    ElevatedButton(
                                              onPressed: () async {
                                                final prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                setState(() {});
                                                if (controller
                                                        .task[index]
                                                        .summary![indexinner]
                                                        .useranswer!
                                                        .isEmpty &&
                                                    (controller
                                                            .task[index]
                                                            .summary![
                                                                (indexinner ==
                                                                        0)
                                                                    ? indexinner
                                                                    : (indexinner -
                                                                        1)]
                                                            .useranswer!
                                                            .isNotEmpty ||
                                                        indexinner == 0)) {
                                                  prefs.setInt('taskIndex',
                                                      index); //setindex incorrect
                                                  prefs.setString(
                                                      'createTaskId',
                                                      controller
                                                              .task[index].id ??
                                                          '');
                                                  if (!context.mounted) return;
                                                  Navigator.pushNamed(context,
                                                      '/assessmentdetail',
                                                      arguments: indexinner);
                                                } else if (controller
                                                    .task[index]
                                                    .summary![indexinner]
                                                    .useranswer!
                                                    .isEmpty) {
                                                  if (!context.mounted) return;
                                                  AlertDialogselect.customDialog(
                                                      context,
                                                      'ไม่สามารถประเมินแบบประเมินนี้ได้',
                                                      'ทำการประเมินแบบประเมิน\nก่อนหน้านี้ให้สำเร็จ',
                                                      const Icon(
                                                          Icons.info_outline),
                                                      false,
                                                      () {});
                                                }
                                              },
                                              style: (controller
                                                      .task[index]
                                                      .summary![indexinner]
                                                      .useranswer!
                                                      .isEmpty)
                                                  ? (controller
                                                                  .task[index]
                                                                  .summary![
                                                                      indexinner]
                                                                  .useranswer!
                                                                  .isEmpty &&
                                                              controller
                                                                  .task[index]
                                                                  .summary![(indexinner ==
                                                                          0)
                                                                      ? indexinner
                                                                      : (indexinner -
                                                                          1)]
                                                                  .useranswer!
                                                                  .isNotEmpty ||
                                                          indexinner == 0)
                                                      ? ElevatedButton
                                                          .styleFrom(
                                                          alignment:
                                                              Alignment.center,
                                                          backgroundColor:
                                                              ColorTheme.main30,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                        )
                                                      : ElevatedButton
                                                          .styleFrom(
                                                          alignment:
                                                              Alignment.center,
                                                          backgroundColor:
                                                              ColorTheme
                                                                  .disableField,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                        )
                                                  : ElevatedButton.styleFrom(
                                                      alignment:
                                                          Alignment.center,
                                                      backgroundColor:
                                                          ColorTheme
                                                              .lightPurple,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                    ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    controller
                                                            .task[index]
                                                            .summary?[
                                                                indexinner]
                                                            .name ??
                                                        '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                            color: ColorTheme
                                                                .main5),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  (controller
                                                          .task[index]
                                                          .summary![indexinner]
                                                          .useranswer!
                                                          .isEmpty)
                                                      ? const SizedBox()
                                                      : Text(
                                                          'สำเร็จ',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodySmall!
                                                              .copyWith(
                                                                  color: ColorTheme
                                                                      .main10),
                                                        ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

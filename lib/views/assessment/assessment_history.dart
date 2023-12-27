import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/constants/helper.dart';
import 'package:mentalassessment/controllers/history_controller.dart';
import 'package:mentalassessment/services/history_service.dart';

import '../../constants/assets.dart';
import '../../constants/theme.dart';
import '../components/component.dart';
import '../widgets/widgetLayout/layout.dart';

class AssessmentHistoryScreen extends StatefulWidget {
  const AssessmentHistoryScreen({super.key});

  @override
  State<AssessmentHistoryScreen> createState() =>
      _AssessmentHistoryScreenState();
}

class _AssessmentHistoryScreenState extends State<AssessmentHistoryScreen> {
  double gap = 16;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      HistoryService.fetchHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        backgroundAsset: Assets.imageBackground2,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: GetX<HistoryController>(
              init: HistoryController(),
              builder: (HistoryController controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Component.backButton(context),
                    SizedBox(height: gap),
                    Text(
                      'ประวัติการทำประเมิน',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: gap),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ทำแบบประเมินไปแล้ว:',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${controller.history.length}',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Component.dividerhorizotal(),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20),
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
                        child: (controller.history.isEmpty)
                            ? const Text('เริ่มทำแบบประเมินเลยสิ!')
                            : Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: controller.history.first.id == null
                                    ? const Text('ไม่มีข้อมูล')
                                    : ListView.separated(
                                        itemCount: controller.history.length,
                                        separatorBuilder: (context, _) =>
                                            SizedBox(height: gap),
                                        itemBuilder: (context, index) =>
                                            Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: const Offset(0, 4),
                                                    spreadRadius: 0,
                                                    blurRadius: 4,
                                                    color:
                                                        ColorTheme.lightGray2)
                                              ],
                                              color: ColorTheme.white,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  '/assessmenthistorydetail',
                                                  arguments: controller
                                                      .history[index]);
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      ((controller
                                                                      .history[
                                                                          index]
                                                                      .summary
                                                                      ?.length ??
                                                                  2) ==
                                                              1)
                                                          ? controller
                                                                  .history[
                                                                      index]
                                                                  .summary
                                                                  ?.first
                                                                  .name ??
                                                              'Unknown'
                                                          : 'แบบประเมินรวม',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              color: ColorTheme
                                                                  .main5),
                                                    ),
                                                    const SizedBox(width: 8),
                                                  ],
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      Helper.dateconverter(
                                                          controller
                                                                  .history[
                                                                      index]
                                                                  .createAt
                                                                  ?.seconds ??
                                                              1000),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              color: ColorTheme
                                                                  .main5),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

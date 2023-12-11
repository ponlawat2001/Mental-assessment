import 'package:flutter/material.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/views/widgets/alert_dialog.dart';
import 'package:mentalassessment/views/widgets/widgetLayout/layout.dart';

import '../../constants/theme.dart';
import '../components/component.dart';

class AssessmentHistoryDetailScreen extends StatefulWidget {
  const AssessmentHistoryDetailScreen({super.key});

  @override
  State<AssessmentHistoryDetailScreen> createState() =>
      _AssessmentHistoryDetailScreenState();
}

class _AssessmentHistoryDetailScreenState
    extends State<AssessmentHistoryDetailScreen> {
  double gap = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        backgroundAsset: Assets.imageBackground2,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Component.backButton(context),
              SizedBox(height: gap),
              Text(
                'ผลการประเมินของคุณ',
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
                    'แบบประเมินรวม',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '23/04/2024 13:00',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Component.dividerhorizotal(),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ListView.separated(
                    itemCount: 5,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: gap);
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: ColorTheme.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'แบบประเมินความเครียด',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'ภาพรวม: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                                Text(
                                  'แย่',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w300,
                                          color: ColorTheme.validation),
                                ),
                              ],
                            ),
                            Component.dividerhorizotal(),
                            Text(
                              'ระดับความเครียด',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'เครียดมาก',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  AlertDialogselect.assessmentAdvice(context,
                                      'ลองทำจิตใจให้สงบยิ่งขึ้นลองคิดให้น้อยลงความกังวลจะลดลงไปด้วย');
                                },
                                child: Text(
                                  'คำแนะนำ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w300,
                                          color: ColorTheme.blue),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

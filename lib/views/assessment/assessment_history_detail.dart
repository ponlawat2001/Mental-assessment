import 'package:flutter/material.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/constants/helper.dart';
import 'package:mentalassessment/model/assessment/history_model.dart';
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
    final HistoryResult args =
        (ModalRoute.of(context)?.settings.arguments) as HistoryResult;

    return Scaffold(
      body: Layout(
        backgroundAsset: Assets.imageBackground2,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName('/navigator'));
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: ColorTheme.main5,
                ),
              ),
              SizedBox(height: gap),
              Text(
                'ผลการประเมินของคุณ',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: gap),
              Wrap(
                runSpacing: 8,
                children: [
                  Text(
                    (args.summary!.length == 1)
                        ? args.summary?.first.name ?? 'Unknown'
                        : 'แบบประเมินรวม',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    Helper.dateconverter(args.createAt?.seconds ?? 0),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: ColorTheme.validation),
                  ),
                ],
              ),
              Component.dividerhorizotal(),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ListView.separated(
                    itemCount: args.summary?.length ?? 0,
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
                              args.summary?[index].name ?? 'Unknown',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            Component.dividerhorizotal(),
                            ListView.separated(
                              shrinkWrap: true,
                              itemCount:
                                  args.summary?[index].scorerate?.length ?? 0,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 16,
                                );
                              },
                              itemBuilder:
                                  (BuildContext context, int innerindex) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      args.summary?[index]
                                              .scorerate?[innerindex].name ??
                                          'Unknown',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      args.summary?[index]
                                              .scorerate?[innerindex].rate ??
                                          'Unknown',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.w300,
                                              color: Helper.scorerateColor(args
                                                      .summary?[index]
                                                      .scorerate?[0]
                                                      .rate ??
                                                  'Unknown')),
                                    ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  AlertDialogselect.assessmentAdvice(context,
                                      args.summary?[index].advise ?? 'Unknown');
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

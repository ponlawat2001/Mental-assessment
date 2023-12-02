import 'package:flutter/material.dart';

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
                      '3',
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
                    child: (false)
                        ? const Text('เริ่มทำแบบประเมินเลยสิ!')
                        : InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/assessmenthistorydetail');
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ListView.separated(
                                itemCount: 2,
                                separatorBuilder: (context, _) =>
                                    SizedBox(height: gap),
                                itemBuilder: (context, index) => Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 4),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            color: ColorTheme.lightGray2)
                                      ],
                                      color: ColorTheme.white,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'แบบประเมินรวม',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: ColorTheme.main5),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'ภาพรวม:',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: ColorTheme.main5),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'แย่',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color:
                                                        ColorTheme.validation),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '13:00 Nov 2012',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: ColorTheme.main5),
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
            ),
          ),
        ),
      ),
    );
  }
}

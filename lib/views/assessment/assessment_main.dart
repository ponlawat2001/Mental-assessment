import 'package:flutter/material.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/constants/theme.dart';
import 'package:mentalassessment/services/assessment_service.dart';
import 'package:mentalassessment/views/components/component.dart';
import 'package:mentalassessment/views/widgets/widgetLayout/layout.dart';

class AssessmentMainScreen extends StatefulWidget {
  const AssessmentMainScreen({super.key});

  @override
  State<AssessmentMainScreen> createState() => _AssessmentMainScreenState();
}

class _AssessmentMainScreenState extends State<AssessmentMainScreen> {
  double gap = 16;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AssessmentService.fetchAssessment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Layout body() => Layout(
        backgroundAsset: Assets.imageBackground2,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Component.backButton(context),
                const SizedBox(height: 16),
                Text(
                  'แบบประเมินรวม',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                Text(
                  'แบบประเมินหลักที่รวมแบบประเมินหลายชุดมาเพื่อความรวดเร็วในการใช้งานสามารถแบ่งทำหลายครั้งได้',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w300),
                ),
                Component.dividerhorizotal(),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: ColorTheme.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'แบบประเมินรวม',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: ColorTheme.main5),
                      ),
                      const SizedBox(height: 16),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: 5,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: gap),
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              color: ColorTheme.main30,
                              borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ประเมินความสำเร็จ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: ColorTheme.main5),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '10 ข้อ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: ColorTheme.main10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    backgroundColor: ColorTheme.main20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/assessmentdescription');
                  },
                  child: Text(
                    'เริ่มทำแบบประเมิน',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ColorTheme.white, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
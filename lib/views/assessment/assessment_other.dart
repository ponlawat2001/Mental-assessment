import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import '../../constants/theme.dart';
import '../components/component.dart';
import '../widgets/widgetLayout/layout.dart';

class AssessmentOtherScreen extends StatefulWidget {
  const AssessmentOtherScreen({super.key});

  @override
  State<AssessmentOtherScreen> createState() => _AssessmentOtherScreenState();
}

class _AssessmentOtherScreenState extends State<AssessmentOtherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  Layout body(context) {
    return Layout(
      backgroundAsset: Assets.imageBackground2,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Component.backButton(context),
              const SizedBox(height: 16),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'แบบประเมินอื่นๆ',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'แบบประเมินอื่นๆที่นอกเหนือจากแบบประเมินรวม',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w300, color: ColorTheme.main5),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Divider(
                                color: ColorTheme.stroke,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        itemCount: 2,
                        separatorBuilder: (context, _) =>
                            const SizedBox(height: 16),
                        itemBuilder: (context, index) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            alignment: Alignment.center,
                            backgroundColor: (index % 2 == 1)
                                ? ColorTheme.main30
                                : ColorTheme.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'แบบประเมินความเข็มแข็งทางใจ',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(width: 16),
                              Text(
                                '20 ข้อ',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/views/widgets/widgetLayout/layout.dart';

import '../../constants/theme.dart';
import '../components/component.dart';

class AssessmentDescriptionScreen extends StatefulWidget {
  const AssessmentDescriptionScreen({super.key});

  @override
  State<AssessmentDescriptionScreen> createState() =>
      _AssessmentDescriptionScreenState();
}

class _AssessmentDescriptionScreenState
    extends State<AssessmentDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  Layout body(BuildContext context) {
    return Layout(
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
                'แบบประเมินความเครียด',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              Component.dividerhorizotal(),
              Text(
                'ความเครียดเกิดขึ้นได้กับทุกคน สาเหตุที่ทําให้เกิดความเครียดมีหลายอย่าง เช่น รายได้ที่ไม่เพียงพอ หนี้สิน ภัยพิบัติต่างๆ ที่ทําให้เกิดความสูญเสียความเจ็บป่วยเป็นต้น ความเครียดมีทั้งประโยชน์และโทษ หากมากเกินไปจะเกิดผลเสียต่อร่างกายและจิตใจของท่านได้ขอให้ท่านลองประเมินตนเองเลือกตรงกับความรู้สึกของท่าน',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w300),
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
                    Navigator.pushNamed(context, '/assessmentdetail');
                  },
                  child: Text(
                    'เริ่มทำแบบประเมิน',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ColorTheme.white, fontWeight: FontWeight.w400),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

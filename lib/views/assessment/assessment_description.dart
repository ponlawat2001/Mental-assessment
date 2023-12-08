import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/controllers/assessment_controller.dart';
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
  final assessmentController = Get.put(AssessmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  Layout body(BuildContext context) {
    final int args = (ModalRoute.of(context)?.settings.arguments ?? 0) as int;
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
                assessmentController.assessment[args].name ?? 'Unknown',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              Component.dividerhorizotal(),
              Text(
                assessmentController.assessment[args].description ?? 'Unknown',
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
                    Navigator.pushNamed(context, '/assessmentdetail',
                        arguments: args);
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/views/widgets/widgetLayout/layout.dart';

import '../../constants/theme.dart';
import '../components/component.dart';

class AssessmentDetailScreen extends StatefulWidget {
  const AssessmentDetailScreen({super.key});

  @override
  State<AssessmentDetailScreen> createState() => _AssessmentDetailScreenState();
}

class _AssessmentDetailScreenState extends State<AssessmentDetailScreen> {
  double gap = 16;
  List<String> list = ['1sdfs', 'sdfdsdsfdsfsf', 'sdsdfsfsdf', 'sdfsdfsddfs'];

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
              SizedBox(height: gap),
              Text(
                'แบบประเมินความเข็มแข็งทางใจ',
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
                    '20/21',
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
                        '1. ฉันรู้สึกห่อเหี่ยวจิตใจกับงานที่ทำอยู่',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: ColorTheme.deleteMode,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: gap),
              Wrap(
                runSpacing: 16,
                spacing: 16,
                children: list.map((e) {
                  return InkWell(
                    onTap: () {},
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
                      child: Text(e),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

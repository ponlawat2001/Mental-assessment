// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/views/components/component.dart';
import 'package:mentalassessment/views/widgets/widgetLayout/layout.dart';

import '../../constants/theme.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  body(BuildContext context) {
    double gap = 16;

    return Layout(
      backgroundAsset: Assets.imageBackground3,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Stack(
              children: [
                Component.backButton(context),
                Column(
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: ColorTheme.white,
                          image: false
                              ? const DecorationImage(
                                  image: AssetImage(Assets.iconImage),
                                  fit: BoxFit.none)
                              : const DecorationImage(
                                  image: NetworkImage(
                                      'https://foyr.com/learn/wp-content/uploads/2021/08/design-your-dream-home.jpg'),
                                  fit: BoxFit.cover)),
                    ),
                    SizedBox(height: gap),
                    const Text('ติดต่อขอคำปรึกษาได้ที่'),
                    SizedBox(height: gap),
                    const Text('ห้องแนะแนวและให้คำปรึกษา'),
                    SizedBox(height: gap),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Divider(
                          color: ColorTheme.main5,
                        )),
                      ],
                    ),
                    SizedBox(height: gap),
                    const Text('อยู่ติดด้านข้างตึกเรียนศึกษาทั่วไป'),
                    SizedBox(height: gap),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.lock_clock_rounded),
                        SizedBox(width: 8),
                        Text('เปิดให้บริการ จันทร์-ศุกร์ เวลา 8:30-16:30 น.'),
                      ],
                    ),
                    SizedBox(height: gap),
                    const Text(
                        'นักศึกษาหรือบุคลากรสามารถเดินเข้าไปใช้บริการได้เลยหรือจะนัดเวลาเข้ามาก่อนที่'),
                    SizedBox(height: gap),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: ColorTheme.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.iconGoogleLogo),
                          const SizedBox(width: 8),
                          const Text('Line: Na091288')
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

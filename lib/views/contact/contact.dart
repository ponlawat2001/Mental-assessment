// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/controllers/contact_controller.dart';
import 'package:mentalassessment/services/contact_service.dart';
import 'package:mentalassessment/views/components/component.dart';
import 'package:mentalassessment/views/widgets/widgetLayout/layout.dart';

import '../../constants/theme.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ContactService.fetchContact();
    });
  }

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
            child: GetX<ContactController>(
              init: ContactController(),
              builder: (ContactController controller) {
                return Stack(
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
                              image:
                                  controller.contact.value.imageContact == null
                                      ? const DecorationImage(
                                          image: AssetImage(Assets.iconImage),
                                          fit: BoxFit.none)
                                      : DecorationImage(
                                          image: NetworkImage(controller
                                                  .contact.value.imageContact ??
                                              ''),
                                          fit: BoxFit.cover)),
                        ),
                        SizedBox(height: gap),
                        Text(
                          'ติดต่อขอคำปรึกษาได้ที่',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                        SizedBox(height: gap),
                        Text(
                          controller.contact.value.nameContact ?? 'Noname',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
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
                        Text(
                          controller.contact.value.locationContact ?? 'NoWhere',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: ColorTheme.main5),
                        ),
                        SizedBox(height: gap),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.iconClock),
                            const SizedBox(width: 8),
                            Text(
                              'เปิดให้บริการ จันทร์-ศุกร์ เวลา 8:30-16:30 น.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: ColorTheme.main5),
                            ),
                          ],
                        ),
                        SizedBox(height: gap),
                        Text(
                          'นักศึกษาหรือบุคลากรสามารถเดินเข้าไปใช้บริการได้เลยหรือจะนัดเวลาเข้ามาก่อนที่',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: ColorTheme.main5),
                        ),
                        SizedBox(height: gap),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: ColorTheme.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.imageLinelogo,
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                      'Line: ${controller.contact.value.lineContact}'),
                                ],
                              ),
                              SizedBox(height: gap),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.imageFacebooklogo,
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                      'Facebook: ${controller.contact.value.facebookContact}'),
                                ],
                              ),
                              SizedBox(height: gap),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.imageGmaillogo,
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                      'Email: ${controller.contact.value.emailContact}'),
                                ],
                              ),
                              SizedBox(height: gap),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.iconPhone,
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                      'Line: ${controller.contact.value.phoneContact}'),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
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

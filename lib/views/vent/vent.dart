import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/controllers/avatar_controller.dart';
import 'package:mentalassessment/views/widgets/widgetLayout/layout.dart';

import '../../constants/theme.dart';

class VentScreen extends StatefulWidget {
  const VentScreen({super.key});

  @override
  State<VentScreen> createState() => _VentScreenState();
}

class _VentScreenState extends State<VentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Layout body() => Layout(
        backgroundAsset: Assets.imageBackground3,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'มีอะไรอยากที่เล่าไหม?',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'วันนี้เจออะไรมาบ้าง \nหรือเขียนแค่อารมณ์ของวันนี้ก็ได้นะ',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'พิมตรงนี้',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    minLines: 7,
                    maxLines: 10,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'ไม่รู้จะพิมพ์อะไรลองใช้ ปุ่มบอกความรู้สึกนี้ดูสิ?',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 125,
                    child: GetX<AvatarController>(
                      init: AvatarController(),
                      builder: (controller) {
                        return controller.users.value != null
                            ? GridView.builder(
                                padding: const EdgeInsets.all(8),
                                scrollDirection: Axis.vertical,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 8,
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 16,
                                  mainAxisExtent: 45,
                                ),
                                itemCount: 15,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorTheme.lightGray2,
                                            offset: const Offset(2, 2),
                                            blurRadius: 2,
                                          ),
                                        ],
                                        color: ColorTheme.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: const Text('Hello'),
                                    ),
                                  );
                                })
                            : Container();
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(4),
                          ),
                          child: Text(
                            'บันทึก',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: ColorTheme.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(4),
                            backgroundColor: ColorTheme.blue,
                          ),
                          child: Text(
                            'บันทึกด้วยเสียง',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: ColorTheme.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(4),
                      backgroundColor: ColorTheme.badScore,
                    ),
                    child: Text(
                      'คลังความรู้สึก',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: ColorTheme.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

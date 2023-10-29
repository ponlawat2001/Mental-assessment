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
    return body();
  }

  Scaffold body() => Scaffold(
        body: Layout(
          backgroundAsset: Assets.imageBackground3,
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
                    height: 150,
                    child: GetX<AvatarController>(
                        init: AvatarController(),
                        builder: (controller) {
                          return controller.users.value != null
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SizedBox(width: 16),
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: ColorTheme.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: const Text('sdfdsfssfsf'),
                                    ),
                                  ),
                                )
                              : Container();
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
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
                      Flexible(
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
                  Flexible(
                    child: ElevatedButton(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

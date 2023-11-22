import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/constants/theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class VentVoiceRecordScreen extends StatefulWidget {
  const VentVoiceRecordScreen({super.key});

  @override
  State<VentVoiceRecordScreen> createState() => _VentVoiceRecordScreenState();
}

class _VentVoiceRecordScreenState extends State<VentVoiceRecordScreen> {
  final record = AudioRecorder();
  final player = AudioPlayer();
  bool isPlay = true;
  bool pause = true;
  bool deleteButton = true;
  String? path;
  bool isRecord = false;
  double gap = 16;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'บันทึกเสียง',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: gap),
            //condition
            if (isRecord)
              Icon(
                Icons.fiber_manual_record,
                color: ColorTheme.deleteMode,
              ),
            //condition
            if (isRecord) SizedBox(height: gap),
            Text(
              '00:00',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: gap),
            path == null ? recordandstop() : afterRecord()
          ],
        ),
      ),
    );
  }

  Column afterRecord() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: ColorTheme.main10,
                    borderRadius: BorderRadius.circular(32)),
                child: IconButton(
                    onPressed: () {},
                    icon:
                        // condition
                        !isPlay || pause
                            ? Icon(
                                Icons.play_arrow,
                                color: ColorTheme.white,
                                size: 32,
                              )
                            : Icon(
                                Icons.pause,
                                color: ColorTheme.white,
                                size: 32,
                              ))),
            if (isPlay) const SizedBox(width: 16),
            if (isPlay)
              Container(
                  decoration: BoxDecoration(
                      color: ColorTheme.main10,
                      borderRadius: BorderRadius.circular(32)),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.stop,
                        color: ColorTheme.white,
                        size: 32,
                      )))
          ],
        ),
        const SizedBox(height: 16),
        deleteButton
            ? Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorTheme.main10,
                        padding: const EdgeInsets.all(8)),
                    child: const Text('บันทึก'),
                  )),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorTheme.validation,
                        padding: const EdgeInsets.all(8)),
                    child: const Text('ยกเลิก'),
                  )),
                ],
              )
            : ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.validation,
                    padding: const EdgeInsets.all(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.iconDelete,
                      colorFilter:
                          ColorFilter.mode(ColorTheme.white, BlendMode.srcIn),
                    ),
                    const SizedBox(width: 8),
                    const Text('ลบ'),
                  ],
                ),
              )
      ],
    );
  }

  Container recordandstop() {
    return Container(
        decoration: BoxDecoration(
            color: ColorTheme.validation,
            borderRadius: BorderRadius.circular(32)),
        child: IconButton(
            onPressed: () async {
              final Directory tempDirectory = await getTemporaryDirectory();

              if (await record.hasPermission()) {
                if (isRecord == false) {
                  await record.start(const RecordConfig(),
                      path: '${tempDirectory.path}/myfile.m4a');
                } else {
                  path = await record.stop();
                  print(path);
                  record.dispose();
                }
              }
              setState(() {
                isRecord = false;
              });
            },
            icon:
                //condition
                isRecord
                    ? Icon(
                        Icons.stop,
                        color: ColorTheme.white,
                        size: 32,
                      )
                    : Icon(
                        Icons.keyboard_voice_outlined,
                        color: ColorTheme.white,
                        size: 24,
                      )));
  }
}

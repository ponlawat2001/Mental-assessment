import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/constants/theme.dart';

class VentVoiceRecordScreen extends StatefulWidget {
  const VentVoiceRecordScreen({super.key});

  @override
  State<VentVoiceRecordScreen> createState() => _VentVoiceRecordScreenState();
}

class _VentVoiceRecordScreenState extends State<VentVoiceRecordScreen> {
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
            if (false)
              Icon(
                Icons.fiber_manual_record,
                color: ColorTheme.deleteMode,
              ),
            //condition
            if (false) SizedBox(height: gap),
            Text(
              '00:00',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: gap),
            recordandstop(false),
            // afterRecord(true, true, true)
          ],
        ),
      ),
    );
  }

  Column afterRecord(bool isPlay, bool pause, bool deleteButton) {
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

  Container recordandstop(bool isRecord) {
    return Container(
        decoration: BoxDecoration(
            color: ColorTheme.validation,
            borderRadius: BorderRadius.circular(32)),
        child: IconButton(
            onPressed: () {},
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

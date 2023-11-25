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
  bool playing = false;
  bool isPlay = false;
  bool pause = true;
  bool deleteButton = true;
  String? audiopath;
  bool isRecord = false;
  double gap = 16;
  Duration duration = const Duration();
  Duration position = const Duration();

  @override
  void dispose() {
    record.dispose();
    player.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    player.onDurationChanged.listen((Duration d) {
      print('Max duration: $d');
      setState(() => duration = d);
    });
    player.onPositionChanged.listen((Duration p) {
      print('Current position: $p');
      setState(() => position = p);
    });
    player.onPlayerComplete.listen((_) {
      playerstop();
    });
  }

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
            if (audiopath != null)
              Text(
                ' ${_printDuration(position)} -- ${_printDuration(duration)}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            SizedBox(height: gap),
            audiopath == null ? recordandstop() : afterRecord()
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
                    onPressed: () async {
                      if (!isPlay && playing == false) {
                        Source urlSource = UrlSource(audiopath ?? '');
                        await player.play(urlSource).catchError((e) {
                          return e;
                        });
                        isPlay = true;
                        playing = true;
                        print('play');
                      } else if (playing == true && pause == false) {
                        await player.pause();
                        print('pause');
                      } else {
                        await player.resume();
                        print('resume');
                      }
                      setState(() {
                        pause = !pause;
                      });
                    },
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
                      onPressed: () async {
                        await playerstop();
                      },
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorTheme.validation,
                        padding: const EdgeInsets.all(8)),
                    child: const Text('ยกเลิก'),
                  )),
                ],
              )
            : ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
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

  Future<void> playerstop() async {
    await player.stop();
    print('stop');
    setState(() {
      position = duration;
      isPlay = false;
      pause = true;
      playing = false;
    });
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
                  await record.start(
                      const RecordConfig(encoder: AudioEncoder.wav),
                      path: '${tempDirectory.path}/myfile.wav');
                } else {
                  audiopath = await record.stop();
                  print(audiopath);
                }
              }
              setState(() {
                isRecord = !isRecord;
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

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}

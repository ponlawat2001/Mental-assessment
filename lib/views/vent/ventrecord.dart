import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/constants/theme.dart';
import 'package:mentalassessment/controllers/vent_controller.dart';
import 'package:mentalassessment/services/vent_service.dart';
import 'package:mentalassessment/views/widgets/alert_dialog.dart';
import '../components/component.dart';
import '../widgets/widgetLayout/layout.dart';

class VentRecordScreen extends StatefulWidget {
  const VentRecordScreen({super.key});

  @override
  State<VentRecordScreen> createState() => _VentRecordScreenState();
}

class _VentRecordScreenState extends State<VentRecordScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      VentService.fetchVentaudio(FirebaseAuth.instance.currentUser!.email);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  RefreshIndicator body() => RefreshIndicator(
        color: ColorTheme.main10,
        onRefresh: () async {
          await VentService.fetchVent(
              FirebaseAuth.instance.currentUser?.email ?? '');
        },
        child: Layout(
          backgroundAsset: Assets.imageBackground3,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(24),
            child: Stack(
              children: [
                Component.backButton(context),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 48,
                    ),
                    Text(
                      'คลังเสียงบันทึก',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 16),
                    Flexible(
                      child: GetX<VentController>(
                        init: VentController(),
                        builder: (VentController controller) {
                          return ListView.separated(
                            itemCount: controller
                                    .ventAudiolist?.value.result?.length ??
                                0,
                            itemBuilder: (context, index) => Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      AlertDialogselect.ventPlayer(
                                          context,
                                          controller.ventAudiolist!.value
                                              .result![index]);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: const Offset(0, 4),
                                                blurRadius: 4,
                                                color: ColorTheme.lightGray2)
                                          ]),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.play_arrow),
                                          const SizedBox(width: 16),
                                          Text(DateFormat.Hm()
                                              .add_yMMMMd()
                                              .format(DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      controller
                                                                  .ventAudiolist
                                                                  ?.value
                                                                  .result?[index]
                                                                  .updateAt[
                                                              '_seconds'] *
                                                          1000))),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 16),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
        ),
      );
}

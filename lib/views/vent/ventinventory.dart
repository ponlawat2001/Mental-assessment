import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/constants/theme.dart';
import 'package:mentalassessment/controllers/vent_controller.dart';
import 'package:mentalassessment/services/vent_service.dart';
import 'package:mentalassessment/views/widgets/alert_dialog.dart';
import '../components/component.dart';
import '../widgets/widgetLayout/layout.dart';

class VentInventoryScreen extends StatefulWidget {
  const VentInventoryScreen({super.key});

  @override
  State<VentInventoryScreen> createState() => _VentInventoryScreenState();
}

class _VentInventoryScreenState extends State<VentInventoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      VentService.fetchVent(FirebaseAuth.instance.currentUser?.email ?? '');
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'คลังความรู้สึก',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/ventrecord');
                            },
                            style: ElevatedButton.styleFrom(
                                alignment: Alignment.center,
                                backgroundColor: ColorTheme.worseEmoji,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 4)),
                            child: const Text('เสียงบันทึก'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Flexible(
                      child: GetX<VentController>(
                        init: VentController(),
                        builder: (VentController controller) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: ListView.separated(
                              itemCount:
                                  controller.ventlist?.value.result?.length ??
                                      0,
                              itemBuilder: (context, index) => Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        AlertDialogselect.ventDetailDialog(
                                            context,
                                            controller.ventlist!.value
                                                .result![index]);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(16),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
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
                                        child: Text(controller.ventlist?.value
                                                .result?[index].ventContent ??
                                            'vent_inventory.dart'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 16),
                            ),
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

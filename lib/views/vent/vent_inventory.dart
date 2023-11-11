import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/constants/theme.dart';
import 'package:mentalassessment/controllers/vent_controller.dart';
import 'package:mentalassessment/services/vent_service.dart';
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

  Layout body() => Layout(
        backgroundAsset: Assets.imageBackground3,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(24),
          child: Stack(
            children: [
              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    'คลังความรู้สึก',
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
                        return (controller.ventlist!.value.result!.isNotEmpty)
                            ? ListView.separated(
                                itemCount:
                                    controller.ventlist?.value.result?.length ??
                                        0,
                                itemBuilder: (context, index) => Row(
                                  children: [
                                    Expanded(
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
                                        child: Text(controller.ventlist?.value
                                                .result?[index].ventContent ??
                                            'vent_inventory.dart'),
                                      ),
                                    ),
                                  ],
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 16),
                              )
                            : Align(
                                alignment: Alignment.center,
                                child: Text('ไม่มีข้อมูล',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: ColorTheme.main5)),
                              );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        )),
      );
}

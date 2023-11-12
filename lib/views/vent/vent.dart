import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/controllers/vent_controller.dart';
import 'package:mentalassessment/services/vent_service.dart';
import 'package:mentalassessment/views/widgets/widgetLayout/layout.dart';

import '../../constants/formvalidate.dart';
import '../../constants/theme.dart';

class VentScreen extends StatefulWidget {
  const VentScreen({super.key});

  @override
  State<VentScreen> createState() => _VentScreenState();
}

class _VentScreenState extends State<VentScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      VentService.fetchVentChoice();
    });
  }

  final _formKey = GlobalKey<FormState>();
  final _ventController = TextEditingController();

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
              child: Form(
                key: _formKey,
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
                      controller: _ventController,
                      validator: (value) {
                        if (Formvalidate.notemptyForm(value ?? '') != '') {
                          return Formvalidate.notemptyForm(value ?? '');
                        }
                        return null;
                      },
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
                      height: 50,
                      child: GetX<VentController>(
                        init: VentController(),
                        builder: (controller) {
                          return controller.ventChoicelist?.value != null
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.ventChoicelist?.value
                                          .result?.length ??
                                      0,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      margin: const EdgeInsets.only(
                                          top: 4, bottom: 4, right: 8, left: 8),
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
                                      child: Text(
                                        controller.ventChoicelist?.value
                                                .result?[index].choice ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ),
                                  ),
                                )
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
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                VentService.createVent(
                                    _ventController.text, context);
                              }
                            },
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
                      onPressed: () {
                        Navigator.pushNamed(context, '/ventinventory');
                      },
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
        ),
      );
}

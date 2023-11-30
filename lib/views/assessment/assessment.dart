import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/views/widgets/alert_dialog.dart';
import 'package:mentalassessment/views/widgets/widgetLayout/layout.dart';
import '../../constants/theme.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  double gap = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body());
  }

  body() => Layout(
        backgroundAsset: Assets.imageBackground2,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'แบบประเมิน',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                Text(
                  'เลือกได้เลยอยากลองทำแบบไหน',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w300),
                ),
                SizedBox(height: gap),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: ColorTheme.editIcon,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        child: Text(
                          'เริ่มทำแบบประเมินรวม',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: ColorTheme.main5),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: ColorTheme.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        child: Text('เริ่มทำแบบประเมินอื่น',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: ColorTheme.main5)),
                      ),
                    )
                  ],
                ),
                SizedBox(height: gap),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: ColorTheme.nodataEmoji,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.iconClock,
                              colorFilter: ColorFilter.mode(
                                  ColorTheme.main5, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'ประวัติการประเมิน',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: ColorTheme.main5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Divider(
                            color: ColorTheme.stroke,
                          )),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: ColorTheme.lightGray2.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 0),
                          BoxShadow(
                            offset: const Offset(0, 4),
                            spreadRadius: 0,
                            blurRadius: 2,
                            color: ColorTheme.white.withOpacity(0.8),
                          ),
                        ]),
                    child: (false)
                        ? const Text('เริ่มทำแบบประเมินเลยสิ!')
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: ListView.separated(
                              itemCount: 2,
                              separatorBuilder: (context, _) =>
                                  SizedBox(height: gap),
                              itemBuilder: (context, index) => Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: ColorTheme.white,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'แบบประเมินรวม',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: ColorTheme.main5),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await AlertDialogselect.customDialog(
                                                context,
                                                'ยืนยันที่จะยกเลิกทำแบบประเมิน',
                                                'คูณจะต้องเริ่มต้นประเมินใหม่ยืนยันหรือไม่?',
                                                SvgPicture.asset(
                                                    Assets.iconInfo),
                                                true,
                                                () {});
                                          },
                                          child: Icon(
                                            Icons.close_outlined,
                                            color: ColorTheme.validation,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      itemCount: 5,
                                      separatorBuilder: (context, index) =>
                                          SizedBox(height: gap),
                                      itemBuilder: (context, index) =>
                                          ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          alignment: Alignment.center,
                                          backgroundColor:
                                              ColorTheme.lightPurple,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'ประเมินความสำเร็จ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color: ColorTheme.main5),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              'สำเร็จ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color: ColorTheme.main10),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

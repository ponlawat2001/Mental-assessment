import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/constants/theme.dart';
import 'package:mentalassessment/model/user/user_model.dart';
import 'package:mentalassessment/model/vent/vent_%20model.dart';
import 'package:mentalassessment/services/user_service.dart';
import 'package:mentalassessment/views/profile/profile_edit.dart';
import 'package:mentalassessment/views/profile/profile_edit_avatar.dart';
import 'package:mentalassessment/views/vent/ventdeleteconfirm.dart';
import 'package:mentalassessment/views/vent/ventdetail.dart';
import 'package:mentalassessment/views/vent/ventvoicerecord.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/vent_service.dart';

class AlertDialogselect {
  static userDeleteDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.iconInfo,
                        width: 36,
                        height: 36,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'ยืนยันที่จะทำรายการลบบัญชี',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'บัญชีจะไม่สามารถนำกลับได้อีก',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await UserService.delete(context);
                                    await FirebaseAuth.instance
                                        .signOut()
                                        .then((e) {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          '/', ModalRoute.withName('/'));
                                    });
                                  },
                                  child: const Text('ยืนยัน'))),
                          const SizedBox(width: 16),
                          Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.center,
                                    backgroundColor: ColorTheme.validation,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('ยกเลิก'))),
                        ],
                      )
                    ],
                  ),
                ),
              ));
        });
  }

  static ventVoiceRecord(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: VentVoiceRecordScreen());
        });
  }

  static ventThankDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ขอบคุณที่เข้ามาเล่าให้เราฟังนะ',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ));
        });
  }

  static ventQuickConfirm(context, String text) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.iconInfo,
                        width: 36,
                        height: 36,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'แสดงความรู้สึก $text',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'ข้อความจะถูกเพิ่มเข้าในคลังความรู้สึก',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await VentService.createVent(
                                        'ปุ่มแสดงความรู้สึก: $text', context);
                                    if (!context.mounted) return;
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('ยืนยัน'))),
                          const SizedBox(width: 16),
                          Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.center,
                                    backgroundColor: ColorTheme.validation,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('ยกเลิก'))),
                        ],
                      )
                    ],
                  ),
                ),
              ));
        });
  }

  static ventDetailDialog(BuildContext context, VentResult data) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: VentDetailScreen(
              ventdata: data,
            ),
          );
        });
  }

  static deleteConfirmDialog(BuildContext context, String id) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: VentDeleteConfirm(
              id: id,
            ),
          );
        });
  }

  static profileEditDialog(BuildContext context, UserResult data) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: ProfileEditScreen(
              userdata: data,
            ),
          );
        });
  }

  static avatarEditDialog(BuildContext context, String avatar) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: ProfileEditAvatarScreen(
              avatarname: avatar,
            ),
          );
        });
  }

  static alertlogout(BuildContext context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            alignment: Alignment.center,
            actionsOverflowButtonSpacing: 0,
            contentPadding: const EdgeInsets.all(16),
            buttonPadding: const EdgeInsets.all(16),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  SvgPicture.asset(
                    Assets.iconInfo,
                    width: 48,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'ยืนยันที่จะทำการออกจากระบบ',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(4),
                  ),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await FirebaseAuth.instance.signOut().then((e) {
                      prefs.remove('token');
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', ModalRoute.withName('/'));
                    });
                  },
                  child: const Text('ตกลง'),
                ),
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.validation,
                    padding: const EdgeInsets.all(4),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('ยกเลิก'),
                ),
              )
            ],
          );
        });
  }

  static Future<void> alertcation(
      BuildContext context, String title, String subtitle) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            alignment: Alignment.center,
            actionsOverflowButtonSpacing: 0,
            contentPadding: const EdgeInsets.all(16),
            buttonPadding: const EdgeInsets.all(16),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  SvgPicture.asset(
                    Assets.iconInfo,
                    width: 48,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('ตกลง'),
              )
            ],
          );
        });
  }

  static loadingDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Center(
            child: CircularProgressIndicator(
          color: ColorTheme.main30,
        ));
      },
    );
  }
}

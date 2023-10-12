import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/constants/theme.dart';

class AlertDialogselect {
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
                    await FirebaseAuth.instance.signOut().then((e) {
                      Navigator.popUntil(context,
                          ModalRoute.withName(Navigator.defaultRouteName));
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

  static Future<void> alertworngpass(BuildContext context) async {
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
                    'อีเมลหรือรหัสผ่านไม่ถูกต้อง',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'กรุณาตรวจสอบอีกครั้ง',
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

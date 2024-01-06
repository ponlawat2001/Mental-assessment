import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mentalassessment/constants/theme.dart';

class Helper {
  static dynamic phoneconverter() {
    if (FirebaseAuth.instance.currentUser!.phoneNumber == null) return null;
    String phoneNumber = FirebaseAuth.instance.currentUser!.phoneNumber!.isEmpty
        ? ''
        : '0${FirebaseAuth.instance.currentUser!.phoneNumber?.substring(3, 12)}';
    return phoneNumber;
  }

  static String dateconverter(int timestamp) {
    return DateFormat.Hm()
        .add_yMMMMd()
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
  }

  static Color scorerateColor(String scorerate) {
    if (scorerate.contains('ดีเยี่ยม')) {
      return ColorTheme.main20;
    } else if (scorerate.contains('ปกติ')) {
      return ColorTheme.main10;
    }
    return ColorTheme.validation;
  }
}

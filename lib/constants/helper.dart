import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class Helper {
  static dynamic phoneconverter() {
    if (FirebaseAuth.instance.currentUser!.phoneNumber == null) return null;
    String phoneNumber =
        '0${FirebaseAuth.instance.currentUser!.phoneNumber?.substring(3, 12)}';
    return phoneNumber;
  }

  static String dateconverter(int timestamp) {
    return DateFormat.Hm()
        .add_yMMMMd()
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
  }
}

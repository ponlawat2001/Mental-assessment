import 'package:firebase_auth/firebase_auth.dart';

class Helper {
  static dynamic phoneconverter() {
    if (FirebaseAuth.instance.currentUser!.phoneNumber == null) return null;
    String phoneNumber =
        '0${FirebaseAuth.instance.currentUser!.phoneNumber?.substring(3, 12)}';
    return phoneNumber;
  }
}

import 'package:email_validator/email_validator.dart';

class Formvalidate {
  static String notemptyForm(String value) {
    return value.isEmpty ? 'ไม่สามารถปล่อยว่างได้' : '';
  }

  static String emailvalidateForm(String value) {
    return EmailValidator.validate(value) ? '' : 'อีเมลไม่ถูกต้อง';
  }

  static String phonevalidateForm(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (!regExp.hasMatch(value) && value.length != 10 && value.isNotEmpty) {
      return 'กรุณากรอกเบอร์มือถือให้ถูกต้อง';
    }
    return '';
  }
}

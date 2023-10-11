import 'package:email_validator/email_validator.dart';

class Formvalidate {
  static String notemptyForm(String value) {
    return value.isEmpty ? 'ไม่สามารถปล่อยว่างได้' : '';
  }

  static String emailvalidateForm(String value) {
    return EmailValidator.validate(value) ? '' : 'อีเมลไม่ถูกต้อง';
  }
}

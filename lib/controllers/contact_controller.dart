import 'package:get/get.dart';
import '../model/contact/contact_model.dart';

class ContactController extends GetxController {
  Rx<ContactResult> contact = ContactResult().obs;

  setcontactlist(ContactResult data) {
    contact.value = data;
    update();
  }
}

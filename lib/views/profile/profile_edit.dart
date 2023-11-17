import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/instance_manager.dart';
import 'package:mentalassessment/controllers/avatar_controller.dart';
import 'package:mentalassessment/model/user/user_model.dart';
import 'package:mentalassessment/views/widgets/alert_dialog.dart';

import '../../constants/formvalidate.dart';
import '../../constants/theme.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key, required this.userdata});
  final UserResult userdata;

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final avatarcontroller = Get.put(AvatarController());
  final TextEditingController displaynameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  double gap = 16;

  @override
  void initState() {
    super.initState();
    displaynameController.text = widget.userdata.displayname ?? '';
    phoneController.text = widget.userdata.phone ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: 425,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'แก้ไขโปรไฟล์',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(height: gap),
          InkWell(
            onTap: () {
              AlertDialogselect.avatarEditDialog(
                  context, widget.userdata.avatar ?? 'female01');
            },
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(avatarcontroller.renderAvatar())),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: ColorTheme.lightGray2,
                    blurRadius: 8.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: gap),
          TextFormField(
            style: Theme.of(context).inputDecorationTheme.labelStyle,
            controller: displaynameController,
            validator: (value) {
              if (Formvalidate.notemptyForm(value ?? '') != '') {
                return Formvalidate.notemptyForm(value ?? '');
              }
              return null;
            },
            cursorColor: ColorTheme.main5,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: ColorTheme.stroke),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: ColorTheme.stroke),
              ),
              hintText: 'Name..',
            ),
          ),
          SizedBox(height: gap),
          TextFormField(
            style: Theme.of(context).inputDecorationTheme.labelStyle,
            controller: phoneController,
            validator: (value) {
              if (Formvalidate.notemptyForm(value ?? '') != '') {
                return Formvalidate.notemptyForm(value ?? '');
              }
              return null;
            },
            keyboardType: TextInputType.phone,
            cursorColor: ColorTheme.main5,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: ColorTheme.stroke),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: ColorTheme.stroke),
              ),
              hintText: 'Phone..',
            ),
          ),
          SizedBox(height: gap),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () async {
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
    );
  }
}

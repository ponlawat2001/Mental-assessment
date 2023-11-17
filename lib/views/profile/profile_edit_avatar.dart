import 'package:flutter/material.dart';

import '../../constants/theme.dart';

class ProfileEditAvatarScreen extends StatefulWidget {
  const ProfileEditAvatarScreen({super.key, this.avatarname});
  final String? avatarname;

  @override
  State<ProfileEditAvatarScreen> createState() =>
      _ProfileEditAvatarScreenState();
}

class _ProfileEditAvatarScreenState extends State<ProfileEditAvatarScreen> {
  double gap = 16;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: 350,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'แก้ไขเปลี่ยนรูปโปรไฟล์',
              style: Theme.of(context).textTheme.titleLarge,
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

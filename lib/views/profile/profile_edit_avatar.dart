import 'package:flutter/material.dart';
import 'package:mentalassessment/constants/assets.dart';

import '../../constants/theme.dart';

class ProfileEditAvatarScreen extends StatefulWidget {
  const ProfileEditAvatarScreen({super.key, this.avatarname});
  final String? avatarname;

  @override
  State<ProfileEditAvatarScreen> createState() =>
      _ProfileEditAvatarScreenState();
}

class _ProfileEditAvatarScreenState extends State<ProfileEditAvatarScreen> {
  String _selecteditem = '';
  double gap = 16;
  List<String> avatarlist = [
    'female01',
    'female02',
    'female03',
    'female04',
    'female05',
    'female06',
    'female07',
    'female08',
    'male01',
    'male02',
    'male03',
    'male04',
    'male05',
    'male06',
    'male07',
  ];

  @override
  void initState() {
    super.initState();
    _selecteditem = widget.avatarname ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: 320,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'เปลี่ยนรูปโปรไฟล์',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(height: gap),
          Flexible(
            // height: 150,
            child: GridView.builder(
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 16, mainAxisSpacing: 16, crossAxisCount: 3),
              itemCount: avatarlist.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selecteditem = avatarlist[index].toString();
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: _selecteditem == avatarlist[index]
                            ? Border.all(
                                width: 2,
                                color: ColorTheme.main10,
                              )
                            : null,
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.asset(
                      '${Assets.imageDirAvatar}/${avatarlist[index]}.png',
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: gap),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context, _selecteditem);
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
                        Navigator.pop(context, widget.avatarname);
                      },
                      child: const Text('ยกเลิก'))),
            ],
          )
        ],
      ),
    );
  }
}

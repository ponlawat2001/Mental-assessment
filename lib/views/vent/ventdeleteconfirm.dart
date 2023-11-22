import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentalassessment/services/vent_service.dart';
import '../../constants/assets.dart';
import '../../constants/theme.dart';

class VentDeleteConfirm extends StatelessWidget {
  const VentDeleteConfirm({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.iconDelete,
              width: 36,
              height: 36,
            ),
            const SizedBox(height: 8),
            Text(
              'ยืนยันที่จะทำรายการลบข้อความ',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'ข้อความจะไม่สามารถกู้กลับมาได้อีก',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () async {
                          await VentService.deleteVent(id, context);
                          if (!context.mounted) return;
                          Navigator.pop(context);
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
      ),
    );
  }
}

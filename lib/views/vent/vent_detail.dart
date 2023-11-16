import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/constants/theme.dart';
import 'package:mentalassessment/model/vent/vent_%20model.dart';
import 'package:mentalassessment/services/vent_service.dart';
import 'package:mentalassessment/views/widgets/alert_dialog.dart';

import '../../constants/formvalidate.dart';

class VentDetailScreen extends StatefulWidget {
  const VentDetailScreen({super.key, required this.ventdata});
  final VentResult ventdata;

  @override
  State<VentDetailScreen> createState() => _VentDetailScreenState();
}

class _VentDetailScreenState extends State<VentDetailScreen> {
  final _ventdetailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _ventdetailController.text = widget.ventdata.ventContent ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'แก้ไขข้อความ',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              InkWell(
                onTap: () async {
                  AlertDialogselect.deleteConfirmDialog(
                      context, widget.ventdata.id ?? '');
                },
                child: SvgPicture.asset(
                  Assets.iconDelete,
                  width: 24,
                  height: 24,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
                'เขียนเมื่อ: ${DateFormat.Hms().add_yMMMd().format(DateTime.fromMillisecondsSinceEpoch(widget.ventdata.updateAt['_seconds'] * 1000))}'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _ventdetailController,
            validator: (value) {
              if (Formvalidate.notemptyForm(value ?? '') != '') {
                return Formvalidate.notemptyForm(value ?? '');
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'พิมตรงนี้',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorTheme.stroke),
                borderRadius: BorderRadius.circular(16),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            keyboardType: TextInputType.multiline,
            minLines: 7,
            maxLines: 10,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () async {
                if (_ventdetailController.text != widget.ventdata.ventContent) {
                  await VentService.updateVent(widget.ventdata.id ?? '',
                      _ventdetailController.text, context);
                }
                if (!context.mounted) return;
                Navigator.pop(context);
              },
              child: const Text('บันทึก'))
        ],
      ),
    );
  }
}

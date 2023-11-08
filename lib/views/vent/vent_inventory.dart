import 'package:flutter/material.dart';
import 'package:mentalassessment/constants/assets.dart';
import '../widgets/widgetLayout/layout.dart';

class VentInventoryScreen extends StatefulWidget {
  const VentInventoryScreen({super.key});

  @override
  State<VentInventoryScreen> createState() => _VentInventoryScreenState();
}

class _VentInventoryScreenState extends State<VentInventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Layout body() => Layout(
        backgroundAsset: Assets.imageBackground3,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(24),
          child: Stack(
            children: [
              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 52,
                  ),
                  Text(
                    'คลังความรู้สึก',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        )),
      );
}

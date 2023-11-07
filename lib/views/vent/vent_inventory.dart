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
    return const Layout(backgroundAsset: Assets.imageBackground3);
  }
}

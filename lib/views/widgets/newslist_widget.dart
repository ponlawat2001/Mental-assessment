import 'package:flutter/material.dart';
import '../components/component.dart';

class NewlistWidget extends StatelessWidget {
  final int itemcount;
  final String headline;
  final String? imagePath;
  final String detail;
  final Axis? axis;
  const NewlistWidget({
    super.key,
    required this.headline,
    this.imagePath,
    required this.detail,
    required this.itemcount,
    this.axis = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: axis!,
      itemCount: itemcount,
      separatorBuilder: (BuildContext context, int index) =>
          axis == Axis.vertical
              ? const SizedBox(height: 16)
              : const SizedBox(width: 16),
      itemBuilder: (BuildContext context, int index) => Component.newsCard(
          context, imagePath, headline, detail, axis == Axis.vertical),
    );
  }
}

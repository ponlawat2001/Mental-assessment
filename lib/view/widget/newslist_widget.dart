import 'package:flutter/material.dart';
import '../component/component.dart';

class NewlistWidget extends StatelessWidget {
  final String headline;
  final String imagePath;
  final String detail;
  const NewlistWidget({
    super.key,
    required this.headline,
    required this.imagePath,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 16,
        ),
        itemBuilder: (BuildContext context, int index) =>
            Component.newsCard(context, imagePath, headline, detail),
      ),
    );
  }
}

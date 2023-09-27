import 'package:flutter/material.dart';
import '../component/component.dart';

class NewlistWidget extends StatelessWidget {
  final int itemcount;
  final String headline;
  final String? imagePath;
  final String detail;
  const NewlistWidget({
    super.key,
    required this.headline,
    this.imagePath,
    required this.detail,
    required this.itemcount,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstOut,
      shaderCallback: (Rect rect) {
        return const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.purple,
            Colors.transparent,
            Colors.transparent,
            Colors.purple
          ],
          stops: [0.0, 0.01, 0.99, 1.0],
        ).createShader(rect);
      },
      child: SizedBox(
        height: 250,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: itemcount,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            width: 16,
          ),
          itemBuilder: (BuildContext context, int index) =>
              Component.newsCard(context, imagePath, headline, detail),
        ),
      ),
    );
  }
}

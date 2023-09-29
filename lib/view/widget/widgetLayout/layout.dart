import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget? child;
  final String backgroundAsset;
  const Layout({
    super.key,
    this.child,
    required this.backgroundAsset,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            image: backgroundAsset.isNotEmpty
                ? DecorationImage(
                    image: AssetImage(backgroundAsset), fit: BoxFit.cover)
                : null),
        child: child);
  }
}

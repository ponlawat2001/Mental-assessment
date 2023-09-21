import 'package:flutter/material.dart';
import '../../constant/assets.dart';

class HomeLayout extends StatelessWidget {
  final Widget? child;
  const HomeLayout({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imageBackground), fit: BoxFit.cover)),
        child: child);
  }
}

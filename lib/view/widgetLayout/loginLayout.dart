import 'package:flutter/material.dart';
import '../../constant/assets.dart';

class LoginLayout extends StatelessWidget {
  final Widget? child;
  const LoginLayout({
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

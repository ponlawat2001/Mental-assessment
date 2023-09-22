import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constant/theme.dart';

class Component {
  static Row socialTextButton(
      BuildContext context, String assetName, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          assetName,
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 16),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: ColorTheme.main5),
        ),
      ],
    );
  }

  static Row dividerOr(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: ColorTheme.main5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'or',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Expanded(
          child: Divider(
            color: ColorTheme.main5,
          ),
        ),
      ],
    );
  }
}

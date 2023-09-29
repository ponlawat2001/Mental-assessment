import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentalassessment/constant/assets.dart';
import 'package:shadow_overlay/shadow_overlay.dart';
import '../../constant/theme.dart';

class Component {
  static ClipRRect newsCard(
    BuildContext context,
    String? imagePath,
    String title,
    String detail,
    bool isvertical,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          ShadowOverlay(
            shadowWidth: 500,
            shadowHeight: 250,
            child: isvertical
                ? Container(
                    height: 250,
                    decoration: BoxDecoration(
                        color: ColorTheme.white,
                        image: DecorationImage(
                            image: AssetImage(imagePath ?? Assets.iconImage),
                            fit: imagePath == null
                                ? BoxFit.none
                                : BoxFit.cover)),
                  )
                : Container(
                    width: 250,
                    decoration: BoxDecoration(
                        color: ColorTheme.white,
                        image: DecorationImage(
                            image: AssetImage(imagePath ?? Assets.iconImage),
                            fit: imagePath == null
                                ? BoxFit.none
                                : BoxFit.cover)),
                  ),
          ),
          isvertical
              ? Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          detail,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: ColorTheme.main5),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          detail,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: ColorTheme.main5),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  static Row socialTextButton(
    BuildContext context,
    String assetName,
    String title,
  ) {
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentalassessment/constants/assets.dart';
import 'package:mentalassessment/model/news/news_model.dart';
import 'package:shadow_overlay/shadow_overlay.dart';
import '../../constants/theme.dart';

class Component {
  static IconButton backButton(context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_rounded),
    );
  }

  static Widget newsCard(
    BuildContext context,
    String? imagePath,
    String title,
    String intro,
    String content,
    bool isvertical,
  ) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/newsdetail',
            arguments: NewsResult(
              imageUrl: imagePath,
              intro: intro,
              newsContent: content,
              title: title,
              isDelete: false,
            ));
      },
      child: ClipRRect(
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
                          image: imagePath == null
                              ? const DecorationImage(
                                  image: AssetImage(Assets.iconImage),
                                  fit: BoxFit.none)
                              : DecorationImage(
                                  image: NetworkImage(imagePath),
                                  fit: BoxFit.cover)),
                    )
                  : Container(
                      width: 250,
                      decoration: BoxDecoration(
                          color: ColorTheme.white,
                          image: imagePath == null
                              ? const DecorationImage(
                                  image: AssetImage(Assets.iconImage),
                                  fit: BoxFit.none)
                              : DecorationImage(
                                  image: NetworkImage(imagePath),
                                  fit: BoxFit.cover)),
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
                            intro,
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
                            intro,
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

import 'package:flutter/material.dart';
import 'package:mentalassessment/view/widget/newslist_widget.dart';
import 'package:mentalassessment/view/widget/widgetLayout/layout.dart';

import '../constant/assets.dart';
import '../constant/theme.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        backgroundAsset: Assets.imageBackground2,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ข่าวสารและบทความ',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 24),
                ),
                const SizedBox(height: 8),
                Text(
                  'รวบรวมข่าวสารและบทความที่มีประโยชน์รอให้คุณค้นพบ',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 16, color: ColorTheme.main5),
                ),
                const SizedBox(height: 8),
                const Flexible(
                  child: NewlistWidget(
                      axis: Axis.vertical,
                      headline: 'โรคซึมเศร้าคืออะไร',
                      detail:
                          'คนส่วนใหญ่แล้วคำว่าโรคซึมเศร้าฟังดูไม่คุ้นหูถ้าพูดถึงเรื่องซึมเศร้าเรามักจะนึกกันว่าเป็นเรื่องของอารมณ์',
                      // imagePath: Assets.imageWelcome,
                      itemcount: 4),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

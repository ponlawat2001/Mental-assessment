import 'package:flutter/material.dart';
import 'package:mentalassessment/services/news_service.dart';
import 'package:mentalassessment/views/widgets/newslist_widget.dart';
import 'package:mentalassessment/views/widgets/widgetLayout/layout.dart';

import '../../constants/assets.dart';
import '../../constants/theme.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NewsService.fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  Layout body(BuildContext context) {
    return Layout(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalassessment/controllers/news_controller.dart';
import '../components/component.dart';

class NewlistWidget extends StatelessWidget {
  final Axis? axis;
  const NewlistWidget({
    super.key,
    this.axis = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<NewsController>(
      init: NewsController(),
      builder: (controller) {
        return ListView.separated(
          scrollDirection: axis!,
          itemCount: controller.newslist.value.result?.length ?? 0,
          separatorBuilder: (BuildContext context, int index) =>
              axis == Axis.vertical
                  ? const SizedBox(height: 16)
                  : const SizedBox(width: 16),
          itemBuilder: (BuildContext context, int index) => Component.newsCard(
              context,
              (controller.newslist.value.result![index].imageUrl
                          ?.contains('http') ??
                      false)
                  ? controller.newslist.value.result![index].imageUrl
                  : null,
              controller.newslist.value.result?[index].title ?? 'Unknown',
              controller.newslist.value.result?[index].intro ?? 'Unknown',
              controller.newslist.value.result?[index].newsContent ?? 'Unknown',
              axis == Axis.vertical),
        );
      },
    );
  }
}

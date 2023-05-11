import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testapp/data/models/news.dart';
import 'package:testapp/static/colors.dart';

class News extends StatelessWidget {
  final NewsModel news;
  const News({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: myColors.white,
          border: Border.all(width: 0.2),
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 132,
            height: 150,
            child: Image.network(news.imageLink!),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            news.title ?? "null",
            maxLines: 1,
            style: TextStyle(
                fontWeight: FontWeight.w600, color: myColors.darkgreen),
          ),
          Container(
            width: 132,
            height: 90,
            padding: const EdgeInsets.all(8),
            child: Text(
              news.summary ?? "null",
              overflow: TextOverflow.fade,
              style: TextStyle(fontSize: 10, color: myColors.darkgreen),
            ),
          )
        ],
      ),
    );
  }
}

class NewsScroll extends StatefulWidget {
  final Widget? Function(BuildContext, int) widget;
  final Axis direction;
  final double height;
  const NewsScroll(
      {super.key,
      required this.widget,
      required this.direction,
      required this.height});

  @override
  State<NewsScroll> createState() => _ScrollVerticalWidgetState();
}

class _ScrollVerticalWidgetState extends State<NewsScroll> {
  Timer? focusChanger;

  final PageController _controller = PageController(viewportFraction: 0.33);
  loop() async {
    focusChanger = Timer.periodic(const Duration(milliseconds: 4000), (timer) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInSine);
    });
  }

  @override
  void initState() {
    loop();
    super.initState();
  }

  @override
  void dispose() {
    focusChanger!.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: PageView.builder(
          scrollDirection: widget.direction,
          controller: _controller,
          itemBuilder: widget.widget),
    );
  }
}

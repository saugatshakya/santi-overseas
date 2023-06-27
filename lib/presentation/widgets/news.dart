import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testapp/data/models/news.dart';
import 'package:testapp/static/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class News extends StatelessWidget {
  final NewsModel news;
  const News({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        launchUrl(Uri.parse(news.newsLink!));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: myColors.white,
            border: Border.all(width: 0.2),
            borderRadius: BorderRadius.circular(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 132,
              height: 150,
              child: Image.network(news.imageLink!,errorBuilder:(_,__,___)=> Image.network("https://media.istockphoto.com/id/1182477852/photo/breaking-news-world-news-with-map-backgorund.jpg?s=612x612&w=0&k=20&c=SQfmzF39HZJ_AqFGosVGKT9iGOdtS7ddhfj0EUl0Tkc="),fit: BoxFit.cover,),
              
              // child: Image.network("https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2023/third-party/skb-1687773608.jpg&w=300&height=200"),
            ),
          
            Text(
              news.title ?? "null",
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: myColors.darkgreen),
            ),
            Container(
              width: 132,
              height:98,
              padding: const EdgeInsets.all(8),
              child: Text(
                news.summary ?? "null",
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 10, color: myColors.darkgreen),
              ),
            )
          ],
        ),
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

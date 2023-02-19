import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testapp/static/colors.dart';

class News extends StatelessWidget {
  const News({
    super.key,
  });

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
            child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/e/e8/Tesla_logo.png"),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Title",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: myColors.darkgreen),
          ),
          Container(
            width: 132,
            height: 90,
            padding: const EdgeInsets.all(8),
            child: Text(
              "Honestly, two weeks ago I would have said yes.But with GPU prices dropping off a cliff, multiple Radeon RX 6600 cards are sitting at 369 right now for a card that (with a few caveats) outperforms the 3050. With RX 6600 being marginally faster, marginally more efficient, and marginally cheaper than the the 3050, you need to weigh your options.If you play AMD games like AC:Valhalla and Far Cry 6 then the Radeon 6600 is practically a no-brainer. It also (for whatever reason) smokes the 3050 in Apex Legends, which has traditionally been the domain of Nvidia cards.This is what’s up.",
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

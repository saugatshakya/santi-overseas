import 'dart:async';

import 'package:flutter/material.dart';

class ScrollWidget extends StatefulWidget {
  final Widget? Function(BuildContext, int) widget;
  final Axis direction;
  final double height;
  final bool reverse;
  final bool stop;
  const ScrollWidget(
      {super.key,
      required this.widget,
      required this.direction,
      required this.height,
      required this.reverse,
      this.stop = true});

  @override
  State<ScrollWidget> createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget> {
  Timer? focusChanger;

  final PageController _controller = PageController(viewportFraction: 0.16);
  loop() async {
    focusChanger = Timer.periodic(
        Duration(milliseconds: widget.stop ? 4000 : 3000), (timer) {
      _controller.nextPage(
          duration: Duration(milliseconds: widget.stop ? 1000 : 3000),
          curve: Curves.linear);
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
          reverse: widget.reverse,
          scrollDirection: widget.direction,
          controller: _controller,
          itemBuilder: widget.widget),
    );
  }
}

class ScrolllVerticle extends StatefulWidget {
  final Widget? Function(BuildContext, int) widget;
  final Axis direction;
  final double height;
  const ScrolllVerticle(
      {super.key,
      required this.widget,
      required this.direction,
      required this.height});

  @override
  State<ScrolllVerticle> createState() => _ScrollVerticalWidgetState();
}

class _ScrollVerticalWidgetState extends State<ScrolllVerticle> {
  Timer? focusChanger;

  final PageController _controller = PageController(viewportFraction: 0.4);
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
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: widget.direction,
          controller: _controller,
          itemBuilder: widget.widget),
    );
  }
}

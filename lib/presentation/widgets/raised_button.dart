import 'package:flutter/material.dart';

class RaisedButton extends StatefulWidget {
  const RaisedButton(
      {super.key,
      required this.label,
      required this.height,
      required this.width,
      required this.fontSize,
      required this.onTap,
      required this.color});

  final String label;
  final double height, width, fontSize;
  final Function onTap;
  final Color color;

  @override
  State<RaisedButton> createState() => _RaisedButtonState();
}

class _RaisedButtonState extends State<RaisedButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animationTween;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(microseconds: 100),
      vsync: this,
    );
    _animationTween =
        Tween(begin: 8.0, end: 0.0).animate(_animationController!);
    _animationController!.addListener(() {
      setState(() {});
    });
  }

  void _onTapDown(TapDownDetails details) {
    _animationController!.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _animationController!.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTap: () {
        widget.onTap();
      },
      child: MouseRegion(                    cursor: SystemMouseCursors.click,

        child: Material(
          borderRadius: BorderRadius.circular(4),
          elevation: _animationTween!.value,
          color: widget.color,
          child: SizedBox(
              width: widget.width,
              height: widget.height,
              child: Center(
                child: Text(
                  widget.label,
                  style:
                      TextStyle(color: Colors.white, fontSize: widget.fontSize),
                ),
              )),
        ),
      ),
    );
  }
}

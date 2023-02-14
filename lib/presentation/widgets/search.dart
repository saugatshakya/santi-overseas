import 'package:flutter/material.dart';
import 'package:testapp/static/colors.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({super.key});

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton>
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

  double elevation = 8;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Material(
        borderRadius: BorderRadius.circular(4),
        elevation: _animationTween!.value,
        color: myColors.darkgreen,
        child: const SizedBox(
            width: 100,
            height: 54,
            child: Center(
              child: Text(
                "SEARCH",
                style: TextStyle(color: Colors.white),
              ),
            )),
      ),
    );
  }
}

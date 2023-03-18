import 'package:flutter/material.dart';
import 'package:testapp/static/colors.dart';

class Searches extends StatefulWidget {
  final String search;
  const Searches({
    super.key,
    required this.search,
  });

  @override
  State<Searches> createState() => _SearchesState();
}

class _SearchesState extends State<Searches> {    bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(cursor: SystemMouseCursors.click,  onEnter: (_) {
        setState(() {
          hovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovering = false;
        });
      },
        child: Container(
          width: 172,
          height: 54,
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color:hovering?myColors.darkgreen: myColors.lightgreen,
              border: Border.all(
                width: 2,
                color: myColors.darkgreen,
              ),
              borderRadius: BorderRadius.circular(4)),
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Icon(Icons.search, color: myColors.white),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                width: 100,
                child: Text(
                  widget.search,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20, color: myColors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

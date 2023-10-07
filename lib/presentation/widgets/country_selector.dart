import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:testapp/static/colors.dart';

class CountrySelector extends StatefulWidget {
  final String country;
  final String code;
  const CountrySelector({super.key, required this.country, required this.code});

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
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
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: hovering ? myColors.darkgreen : myColors.lightgreen,
            border: Border.all(color: myColors.white, width: 2),
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: [
            Flag.fromString(
              widget.code,
              height: 48,
              width: 48,
            ),
            const SizedBox(
              width: 32,
            ),
            Expanded(
              child: Text(
                widget.country,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 18, color: myColors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

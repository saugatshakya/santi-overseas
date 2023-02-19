import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:testapp/static/colors.dart';

class CountrySelector extends StatelessWidget {
  final String country;
  final FlagsCode code;
  const CountrySelector({super.key, required this.country, required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: myColors.lightgreen,
          border: Border.all(color: myColors.white, width: 2),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Flag.fromCode(
            code,
            height: 48,
            width: 48,
          ),
          const SizedBox(
            width: 32,
          ),
          Text(
            country,
            style: TextStyle(fontSize: 18, color: myColors.white),
          )
        ],
      ),
    );
  }
}

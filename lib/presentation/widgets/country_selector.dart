import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:testapp/static/colors.dart';

class CountrySelector extends StatelessWidget {
  final String country;
  final FlagsCode code;
  const CountrySelector({super.key, required this.country, required this.code});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: myColors.lightgreen, width: 2),
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: [
            Flag.fromCode(
              code,
              height: 32,
              width: 32,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              country,
              style: TextStyle(fontSize: 18, color: myColors.darkgreen),
            )
          ],
        ),
      ),
    );
  }
}

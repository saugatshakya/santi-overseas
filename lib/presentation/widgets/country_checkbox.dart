import 'package:flutter/material.dart';
import 'package:testapp/static/colors.dart';

class CountryCheckbox extends StatefulWidget {
  final String country;
  final bool value;
  const CountryCheckbox(
      {super.key, required this.country, required this.value});

  @override
  State<CountryCheckbox> createState() => _CountryCheckboxState();
}

class _CountryCheckboxState extends State<CountryCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: BoxDecoration(
        border: Border.all(width: 0.4),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Row(children: [
          Checkbox(
            value: widget.value,
            onChanged: null,
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return myColors.darkgreen;
            }),
          ),
          Text(
            widget.country,
            style: const TextStyle(fontSize: 18),
          )
        ]),
      ),
    );
  }
}

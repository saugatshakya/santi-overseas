import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:testapp/static/colors.dart';

class Searches extends StatelessWidget {
  final String search;
  const Searches({
    super.key,
    required this.search,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 172,
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(
            color: myColors.lightgreen,
          ),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Icon(Icons.search, color: myColors.darkgreen),
          const SizedBox(
            width: 16,
          ),
          Text(
            search,
            style: TextStyle(fontSize: 18, color: myColors.darkgreen),
          )
        ],
      ),
    );
  }
}

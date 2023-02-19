import 'package:flutter/material.dart';
import 'package:testapp/static/colors.dart';

class Searches extends StatelessWidget {
  final String search;
  const Searches({
    super.key,
    required this.search,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 172,
        height: 54,
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: myColors.lightgreen,
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
                search,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20, color: myColors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

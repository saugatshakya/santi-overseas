import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testapp/static/colors.dart';

class JobListing extends StatelessWidget {
  const JobListing({super.key, required this.i});
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4, bottom: 16),
      padding: const EdgeInsets.only(bottom: 16),
      decoration: i == 1
          ? const BoxDecoration()
          : const BoxDecoration(border: Border(bottom: BorderSide())),
      child: ListTile(
        title: Row(children: [
          Text(
            "Security Guard",
            style: TextStyle(fontSize: 20, color: myColors.darkgreen),
          ),
          const SizedBox(
            width: 32,
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              decoration: BoxDecoration(
                  border: Border.all(color: myColors.lightgreen),
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                "50",
                style: TextStyle(fontSize: 14, color: myColors.darkgreen),
              ))
        ]),
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ABC/XYZ Company",
              style: TextStyle(fontSize: 14, color: myColors.darkgreen),
            ),
            Row(
              children: [
                Text(
                  "Basic Salary:",
                  style: TextStyle(fontSize: 14, color: myColors.darkgreen),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "रु 5000",
                  style: TextStyle(fontSize: 14, color: myColors.darkgreen),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  "Posted On:",
                  style: TextStyle(fontSize: 14, color: myColors.darkgreen),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  DateFormat("yyyy-MM-dd").format(DateTime.now()),
                  style: TextStyle(fontSize: 14, color: myColors.darkgreen),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  "Apply Before:",
                  style: TextStyle(fontSize: 14, color: myColors.darkgreen),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  DateFormat("yyyy-MM-dd").format(DateTime.now()),
                  style: TextStyle(fontSize: 14, color: myColors.darkgreen),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

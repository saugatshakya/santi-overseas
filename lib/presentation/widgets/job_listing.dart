import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testapp/presentation/widgets/my_appbar.dart';
import 'package:testapp/presentation/widgets/raised_button.dart';
import 'package:testapp/static/colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class JobListing extends StatefulWidget {
  const JobListing({super.key, required this.i});
  final int i;

  @override
  State<JobListing> createState() => _JobListingState();
}

class _JobListingState extends State<JobListing> {
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MouseRegion(
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
      child: Card(
        elevation: hovering ? 0 : 4,
        color: hovering ? Colors.black38 : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          padding: const EdgeInsets.all(12),
          width: width * 0.32,
          child: ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(4)),
            ),
            trailing: Column(
              children: [
                Text(
                  "Posted ${timeago.format(DateTime.now().subtract(const Duration(days: 10)))}",
                  style: TextStyle(
                      fontSize: 12,
                      color: hovering ? Colors.white : myColors.darkgreen),
                ),
                const SizedBox(
                  height: 4,
                ),
                RaisedButton(
                    label: "APPLY",
                    height: 24,
                    width: 54,
                    fontSize: 12,
                    color: hovering ? Colors.green : myColors.darkgreen,
                    onTap: () {})
              ],
            ),
            title: Row(children: [
              Text(
                "Security Guard",
                style: TextStyle(
                    fontSize: 20,
                    color: hovering ? Colors.white : myColors.darkgreen),
              ),
              const SizedBox(
                width: 32,
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: hovering ? Colors.white : myColors.lightgreen),
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    "50",
                    style: TextStyle(
                        fontSize: 14,
                        color: hovering ? Colors.white : myColors.darkgreen),
                  ))
            ]),
            isThreeLine: true,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "ABC/XYZ Company",
                  style: TextStyle(
                      fontSize: 14,
                      color: hovering ? Colors.white : myColors.darkgreen),
                ),
                Row(
                  children: [
                    Text(
                      "Basic Salary:",
                      style: TextStyle(
                          fontSize: 14,
                          color: hovering ? Colors.white : myColors.darkgreen),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "रु 5000",
                      style: TextStyle(
                          fontSize: 14,
                          color: hovering ? Colors.white : myColors.darkgreen),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Apply Before:",
                      style: TextStyle(
                          fontSize: 14,
                          color: hovering ? Colors.white : myColors.darkgreen),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      DateFormat("yyyy-MM-dd").format(DateTime.now()),
                      style: TextStyle(
                          fontSize: 14,
                          color: hovering ? Colors.white : myColors.darkgreen),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

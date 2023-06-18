import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/data/functions/jobs.dart';
import 'package:testapp/data/functions/utils.dart';
import 'package:testapp/data/models/job.dart';
import 'package:testapp/data/repo/user_info.dart';
import 'package:testapp/presentation/widgets/raised_button.dart';
import 'package:testapp/presentation/widgets/show_auth.dart';
import 'package:testapp/static/colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class JobListingMobile extends StatefulWidget {
  const JobListingMobile({super.key, required this.job});
  final JobModel job;

  @override
  State<JobListingMobile> createState() => _JobListingMobileState();
}

class _JobListingMobileState extends State<JobListingMobile> {
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
      child: GestureDetector(
        onTap: () {
          appStateController.selectJob(widget.job);
          appStateController.changePage(5);
        },
        child: Card(
          elevation: hovering ? 0 : 4,
          color: hovering ? Colors.black38 : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Container(
            padding: const EdgeInsets.all(12),
            constraints: const BoxConstraints(minWidth: 300),
            width: width,
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(4)),
              ),
              trailing: getSmartPhoneOrTablet() == phoneType || width < 1275
                  ? const SizedBox()
                  : Column(
                      children: [
                        Text(
                          "Posted ${timeago.format(DateTime.parse(widget.job.postedOn ?? DateTime.now().toString()))}",
                          style: TextStyle(
                              fontSize: 12,
                              color:
                                  hovering ? Colors.white : myColors.darkgreen),
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
                            onTap: () async {
                              log("Tap");
                              String? userInfo = await UserInfo().getUserInfo();
                              log("userinfo: $userInfo");
                              if (userInfo == null) {
                                log("here");
                                showAuthDialog();
                              } else {
                                log("over here");
                                JobsApi().apply(widget.job.id, userInfo);
                                // Get.dialog(const Center(
                                //   child: Dialog(
                                //     child: SizedBox(
                                //       width: 132,
                                //       height: 54,
                                //       child:
                                //           Center(child: Text("Successfully Applied")),
                                //     ),
                                //   ),
                                // ));
                              }
                            }),
                      ],
                    ),
              title: Row(children: [
                Text(
                  widget.job.title ?? "-",
                  style: TextStyle(
                      fontSize: 20,
                      color: hovering ? Colors.white : myColors.darkgreen),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color:
                                hovering ? Colors.white : myColors.lightgreen),
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      widget.job.requiredNumbers.toString(),
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
                    widget.job.company!.name ?? "-",
                    style: TextStyle(
                        fontSize: 14,
                        color: hovering ? Colors.white : myColors.darkgreen),
                  ),
                  Wrap(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Basic Salary:",
                            style: TextStyle(
                                fontSize: 14,
                                color: hovering
                                    ? Colors.white
                                    : myColors.darkgreen),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "रु ${widget.job.salary ?? "-"}",
                            style: TextStyle(
                                fontSize: 14,
                                color: hovering
                                    ? Colors.white
                                    : myColors.darkgreen),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            "Apply Before:",
                            style: TextStyle(
                                fontSize: 14,
                                color: hovering
                                    ? Colors.white
                                    : myColors.darkgreen),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            DateFormat("yyyy-MM-dd").format(DateTime.parse(
                                widget.job.applyBefore ??
                                    DateTime.now().toString())),
                            style: TextStyle(
                                fontSize: 14,
                                color: hovering
                                    ? Colors.white
                                    : myColors.darkgreen),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  getSmartPhoneOrTablet() == phoneType || width < 1275
                      ? Row(
                          children: [
                            Text(
                              "Posted ${timeago.format(DateTime.now().subtract(const Duration(days: 10)))}",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: hovering
                                      ? Colors.white
                                      : myColors.darkgreen),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            RaisedButton(
                                label: "APPLY",
                                height: 24,
                                width: 54,
                                fontSize: 12,
                                color: hovering
                                    ? Colors.green
                                    : myColors.darkgreen,
                                onTap: () async {
                                  String? userInfo =
                                      await UserInfo().getUserInfo();
                                  log("userinfo: $userInfo");
                                  if (userInfo == null) {
                                    log("here");
                                    showAuthDialog();
                                  } else {
                                    log("over here");
                                    JobsApi().apply(widget.job.id, userInfo);
                                    // Get.dialog(const Center(
                                    //   child: Dialog(
                                    //     child: SizedBox(
                                    //       width: 132,
                                    //       height: 54,
                                    //       child:
                                    //           Center(child: Text("Successfully Applied")),
                                    //     ),
                                    //   ),
                                    // ));
                                  }
                                }),
                          ],
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

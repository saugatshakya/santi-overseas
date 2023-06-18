import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/data/functions/jobs.dart';
import 'package:testapp/data/models/job.dart';
import 'package:testapp/data/repo/user_info.dart';
import 'package:testapp/presentation/widgets/raised_button.dart';
import 'package:testapp/presentation/widgets/show_auth.dart';
import 'package:testapp/static/colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class JobDetail extends StatelessWidget {
  final JobModel job;

  const JobDetail({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: Get.width,
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SizedBox(
                      height: 64,
                      width: 64,
                      child: Image.asset(
                        "assets/company.jpg",
                        fit: BoxFit.cover,
                      )),
                ),
                title: Text(job.title ?? "-"),
                subtitle: Text(job.company!.name ?? "-"),
                trailing: RaisedButton(
                    label: "APPLY",
                    height: 24,
                    width: 54,
                    fontSize: 12,
                    color: myColors.darkgreen,
                    onTap: () async {
                      String? userInfo = await UserInfo().getUserInfo();
                      if (userInfo == null) {
                        showAuthDialog();
                      } else {
                        JobsApi().apply(job.id, userInfo);
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
              ),
            ),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Details",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: myColors.darkgreen)),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Required Numbers:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("Category:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("Hours Per Day:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("Hours Per Week:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("Posted :",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("Apply Before:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                      ],
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${job.requiredNumbers}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("${job.category}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("${job.workingHoursPerDay}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("${job.workingDaysPerWeek}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                            timeago.format(DateTime.parse(job.postedOn ?? DateTime.now().toString())),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("${job.applyBefore}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Qualification",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: myColors.darkgreen)),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Minimum Qualification:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("Minimum Experience:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("Minimum Age:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("Skills:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                      ],
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    SizedBox(
                      width: Get.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${job.minQualification}",
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: myColors.darkgreen)),
                          const SizedBox(
                            height: 4,
                          ),
                          Text("${job.minExperience}",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: myColors.darkgreen)),
                          const SizedBox(
                            height: 4,
                          ),
                          Text("${job.ageRequirement}",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: myColors.darkgreen)),
                          const SizedBox(
                            height: 4,
                          ),
                          Text("${job.skills}",
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: myColors.darkgreen)),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Amneties",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: myColors.darkgreen)),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Salary:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("Earning:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("Accommodation:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("Food:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("Vacation:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("Food:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("OverTime:",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                      ],
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${job.salary}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("${job.earning}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("${job.accommodation}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("${job.food}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("${job.annualVacation}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("${job.overTime}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: myColors.darkgreen)),
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

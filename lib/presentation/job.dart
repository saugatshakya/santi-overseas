import 'package:flutter/material.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/data/functions/jobs.dart';
import 'package:testapp/data/models/job.dart';
import 'package:testapp/data/repo/user_info.dart';
import 'package:testapp/presentation/widgets/raised_button.dart';
import 'package:testapp/presentation/widgets/show_auth.dart';
import 'package:testapp/static/colors.dart';

class Job extends StatelessWidget {
  final JobModel job;
  const Job({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Transform.scale(
              scale: 2,
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 300,
                child: ListTile(
                  leading: job.company == null || job.company!.logo == null
                      ? const SizedBox()
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: SizedBox(
                              height: 64,
                              width: 64,
                              child: Image.network(
                                job.company!.logo!,
                                fit: BoxFit.cover,
                              )),
                        ),
                  title: Text(job.title ?? "-"),
                  subtitle: job.company == null
                      ? const SizedBox()
                      : Text(job.company!.name ?? "-"),
                  trailing: RaisedButton(
                      label: "APPLY",
                      height: 24,
                      width: 54,
                      fontSize: 12,
                      color: myColors.darkgreen,
                      onTap: () {
                        if (appStateController.user == null) {
                          showAuthDialog();
                        } else {
                          JobsApi().apply(job.id);
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
            ),
            const SizedBox(
              height: 64,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                            Text("Country:",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: myColors.darkgreen)),
                            const SizedBox(
                              height: 4,
                            ),
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
                            Text("Posted On:",
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
                            job.country == null
                                ? const SizedBox()
                                : Text("${job.country!.name}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: myColors.darkgreen)),
                            const SizedBox(
                              height: 4,
                            ),
                            Text("${job.requiredNumbers ?? "-"}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: myColors.darkgreen)),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(job.category ?? "-",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: myColors.darkgreen)),
                            const SizedBox(
                              height: 4,
                            ),
                            Text("${job.workingHoursPerDay ?? "-"}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: myColors.darkgreen)),
                            const SizedBox(
                              height: 4,
                            ),
                            Text("${job.workingDaysPerWeek ?? "-"}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: myColors.darkgreen)),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(job.postedOn ?? "-",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: myColors.darkgreen)),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(job.applyBefore ?? "-",
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(job.minQualification ?? "-",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: myColors.darkgreen)),
                            const SizedBox(
                              height: 4,
                            ),
                            Text("${job.minExperience ?? "-"}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: myColors.darkgreen)),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(job.ageRequirement ?? "-",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: myColors.darkgreen)),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(job.skills ?? "-",
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
                            Text("${job.salary ?? "-"}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: myColors.darkgreen)),
                            const SizedBox(
                              height: 4,
                            ),
                            Text("${job.earning ?? "-"}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: myColors.darkgreen)),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(job.accommodation ?? "-",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: myColors.darkgreen)),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(job.food ?? "-",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: myColors.darkgreen)),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(job.annualVacation ?? "-",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: myColors.darkgreen)),
                            const SizedBox(
                              height: 4,
                            ),
                            Text("${job.overTime ?? "-"}",
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
          ],
        ),
      ),
    );
  }
}

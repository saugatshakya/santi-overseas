import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/presentation/widgets/company_logo.dart';
import 'package:testapp/presentation/widgets/job_listing.dart';
import 'package:testapp/presentation/widgets/scroll_widget.dart';
import 'package:testapp/static/colors.dart';

class MainTable extends StatelessWidget {
  const MainTable({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
        init: appStateController,
        builder: (state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 400,
                    width: Get.width * 0.42,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "New Jobs",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: myColors.darkgreen),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        if (state.jobs.isNotEmpty)
                          ScrolllVerticle(
                              height: 280,
                              widget: (context, i) => Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: JobListing(
                                        job: state.jobs[i % state.jobs.length]),
                                  ),
                              direction: Axis.vertical),
                        const SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: () {
                            state.changePage(1);
                          },
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: myColors.lightgreen),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Text(
                                "View All Job Listings",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: myColors.darkgreen),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 2,
                  height: 300,
                  color: myColors.darkgreen,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: Get.width * 0.42,
                    height: 400,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Advertisement",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: myColors.darkgreen),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        if (state.adImage != null)
                          SizedBox(
                            height: 300,
                            child: Image.network(
                                "http://freeticketfreevisa.com/${state.adImage!.imagePath}"),
                          )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

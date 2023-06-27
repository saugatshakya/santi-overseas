import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/app_state_controller.dart';
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
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                width: Get.width * 0.46,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "New Job".tr,
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
                              border: Border.all(color: myColors.lightgreen),
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
              Container(
                color: myColors.darkgreen.withOpacity(0.8),
                width: Get.width * 0.54,
                height: 400,
                child: state.adImage != null
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => Get.dialog(Center(
                            child: Image.network(
                                "https://freeticketfreevisa.com/${state.adImage!.imagePath}"),
                          )),
                          child: Image.network(
                            "https://freeticketfreevisa.com/${state.adImage!.imagePath}",
                            fit: BoxFit.contain,
                            colorBlendMode: BlendMode.softLight,
                            color: myColors.darkgreen.withOpacity(0.8),
                          ),
                        ),
                      )
                    : const SizedBox(),
              )
            ],
          );
        });
  }
}

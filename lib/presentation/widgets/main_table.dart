import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/presentation/widgets/job_listing.dart';
import 'package:testapp/presentation/widgets/scroll_widget.dart';
import 'package:testapp/static/colors.dart';

class MainTable extends StatefulWidget {
  const MainTable({super.key});

  @override
  State<MainTable> createState() => _MainTableState();
}

class _MainTableState extends State<MainTable> {
  int currentImage = 0;
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
              ),if(state.adImage.isNotEmpty)
              SizedBox(width: Get.width * 0.54,
                  height: 400,
                child: Row(
                  children: [currentImage!=0?GestureDetector(onTap: (){setState(() {
                    currentImage--;
                  });},child: Container(height: 400,width: 64,color: myColors.darkgreen.withOpacity(0.5),child:const Center(child: Icon(Icons.skip_previous),),)):SizedBox(width: 64,),Container(
                    color: myColors.darkgreen.withOpacity(0.8),
                    width: Get.width * 0.54-128,
                    height: 400,
                    child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => Get.dialog(Center(
                                child: Image.network(
                                    "https://freeticketfreevisa.com/${state.adImage[currentImage].imagePath}"),
                              )),
                              child: Image.network(
                                "https://freeticketfreevisa.com/${state.adImage[currentImage].imagePath}",
                                fit: BoxFit.contain,
                                colorBlendMode: BlendMode.softLight,
                                color: myColors.darkgreen.withOpacity(0.8),
                              ),
                            ),
                          )
                        
                  ),currentImage!=state.adImage.length-1?GestureDetector(onTap: (){setState(() {
                    currentImage++;
                  });},child: Container(height: 400,width: 64,color: myColors.darkgreen.withOpacity(0.5),child:const Center(child: Icon(Icons.skip_next),),)):SizedBox(width: 64,)]
                ),
              )
            ],
          );
        });
  }
}

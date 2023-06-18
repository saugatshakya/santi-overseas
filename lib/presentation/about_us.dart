import 'package:flutter/material.dart';
import 'package:testapp/static/colors.dart';
import 'package:get/get.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColors.white.withOpacity(0.95),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 164,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("assets/17278525.png"),
                    opacity: 0.3,
                    fit: BoxFit.cover),
                gradient: LinearGradient(
                    colors: [myColors.darkgreen, myColors.lightgreen],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
            child: Text(
              "companyInfo".tr,
              style: TextStyle(fontSize: 32, color: myColors.white),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    // Text("INTRODUCTION",
                    //     style: TextStyle(
                    //         fontSize: 22,
                    //         fontWeight: FontWeight.w600,
                    //         color: myColors.darkgreen)),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    Text("companyInfo1".tr,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 48,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 64,
                      padding: const EdgeInsets.only(left: 32, top: 16),
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/17278525.png"),
                              opacity: 0.3,
                              fit: BoxFit.cover),
                          gradient: LinearGradient(
                              colors: [myColors.darkgreen, myColors.lightgreen],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight)),
                      child: Text("vision".tr,
                          style:
                              TextStyle(fontSize: 32, color: myColors.white)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text("vision1".tr,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 48,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 64,
                      padding: const EdgeInsets.only(left: 32, top: 16),
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/17278525.png"),
                              opacity: 0.3,
                              fit: BoxFit.cover),
                          gradient: LinearGradient(
                              colors: [myColors.darkgreen, myColors.lightgreen],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight)),
                      child: Text("mission".tr,
                          style:
                              TextStyle(fontSize: 32, color: myColors.white)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text("mission1".tr,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("mission2".tr,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("mission3".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 48,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 64,
                      padding: const EdgeInsets.only(left: 32, top: 16),
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/17278525.png"),
                              opacity: 0.3,
                              fit: BoxFit.cover),
                          gradient: LinearGradient(
                              colors: [myColors.darkgreen, myColors.lightgreen],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight)),
                      child: Text("focus".tr,
                          style:
                              TextStyle(fontSize: 32, color: myColors.white)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text("focus1".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("focus2".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("focus3".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("focus4".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("focus5".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

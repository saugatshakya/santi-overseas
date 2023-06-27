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

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("focus2".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("focus3".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("focus4".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("focus5".tr,

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
                      child: Text("cooperate".tr,
                          style:
                              TextStyle(fontSize: 32, color: myColors.white)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text("cooperate1".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("cooperate2".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("cooperate3".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("cooperate4".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("cooperate5".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),      const SizedBox(
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
                      child: Text("recruit".tr,
                          style:
                              TextStyle(fontSize: 32, color: myColors.white)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text("recruit1".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recruit2".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recruit3".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recruit4".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recruit5".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                            const SizedBox(
                      height: 16,
                    ),
                    Text("recruit6".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recruit7".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recruit8".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recruit9".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recruit10".tr,

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
                      child: Text("terms".tr,
                          style:
                              TextStyle(fontSize: 32, color: myColors.white)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text("terms1".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("terms2".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("terms3".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("terms4".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("terms5".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                            const SizedBox(
                      height: 16,
                    ),
                    Text("terms6".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("terms7".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("terms8".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("terms9".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("terms10".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),  const SizedBox(
                      height: 16,
                    ),
                    Text("terms11".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("terms12".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("terms13".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("terms14".tr,

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
                      child: Text("recuitment".tr,
                          style:
                              TextStyle(fontSize: 32, color: myColors.white)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text("recuitment1".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment2".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment3".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment4".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment5".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                            const SizedBox(
                      height: 16,
                    ),
                    Text("recuitment6".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment7".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment8".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment9".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment10".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),  const SizedBox(
                      height: 16,
                    ),
                    Text("recuitment11".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment12".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment13".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment14".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                             const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment15".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                            const SizedBox(
                      height: 16,
                    ),
                    Text("recuitment16".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment17".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment18".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment19".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment20".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),  const SizedBox(
                      height: 16,
                    ),
                    Text("recuitment21".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment22".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment23".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment24".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                             const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment25".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                            const SizedBox(
                      height: 16,
                    ),
                    Text("recuitment26".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment27".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment28".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment29".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment30".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),  const SizedBox(
                      height: 16,
                    ),
                    Text("recuitment31".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment32".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment33".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment34".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                             const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment35".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                            const SizedBox(
                      height: 16,
                    ),
                    Text("recuitment36".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment37".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment38".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment39".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment40".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),  const SizedBox(
                      height: 16,
                    ),
                    Text("recuitment41".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment42".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment43".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment44".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),  const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment45".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                            const SizedBox(
                      height: 16,
                    ),
                    Text("recuitment46".tr,

                        style: TextStyle(
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: myColors.darkgreen)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("recuitment47".tr,

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

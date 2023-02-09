import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:testapp/static/colors.dart';

class TempHomePhone extends StatelessWidget {
  const TempHomePhone({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
              width: width,
              height: height,
              child: Stack(
                children: [
                  CircularParticle(
                    awayRadius: 100,
                    numberOfParticles: 300,
                    speedOfParticles: 0.5,
                    height: Get.height,
                    width: Get.width,
                    onTapAnimation: true,
                    particleColor: myColors.darkgreen.withOpacity(0.2),
                    awayAnimationDuration: const Duration(milliseconds: 200),
                    maxParticleSize: 5,
                    isRandSize: true,
                    awayAnimationCurve: Curves.decelerate,
                    enableHover: true,
                    hoverColor: myColors.darkgreen,
                    hoverRadius: 200,
                    connectDots: false,
                    isRandomColor: false,
                  ),
                  Positioned(
                      top: 0,
                      child: Container(
                        color: Colors.white60,
                        height: 64,
                        width: width,
                        child: Row(
                          children: [
                            SizedBox(
                                width: 64,
                                height: 64,
                                child: Image.asset(
                                  "assets/logo.png",
                                  fit: BoxFit.fill,
                                )),
                            Container(
                              width: 2,
                              height: 48,
                              color: Colors.green,
                            ),
                            const SizedBox(
                              width: 32,
                            ),
                            const SizedBox(
                              height: 54,
                              child: Text(
                                "Santi\nOverseas",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                const SizedBox(
                                  width: 96,
                                  height: 32,
                                  child: Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 96,
                                  height: 32,
                                  child: Center(
                                    child: Text(
                                      "Signup",
                                      style: TextStyle(
                                          color: myColors.darkgreen,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                  Positioned(
                      top: Get.height * 0.2,
                      right: 16,
                      child: Opacity(
                        opacity: 0.9,
                        child: SizedBox(
                            width: Get.width * 0.8,
                            child: Image.asset("assets/worker.png")),
                      )),
                  Positioned(
                    top: Get.height * 0.55,
                    left: 8,
                    child: IgnorePointer(
                      child: Container(
                        color: Colors.white54,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Discover the Perfect\ninternational job for you",
                                style: TextStyle(
                                    color: myColors.darkgreen,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "To get your dream job register & fill out your profile first",
                                style: TextStyle(
                                    color: myColors.darkgreen,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Text(
                      "Coming Soon",
                      style: TextStyle(
                          color: myColors.darkgreen,
                          fontSize: 28,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ))),
    );
  }
}

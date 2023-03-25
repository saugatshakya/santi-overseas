import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/data/functions/auth.dart';
import 'package:testapp/data/functions/utils.dart';
import 'package:testapp/static/colors.dart';
import 'dart:html' as html;

class MyAppBar extends AppBar {
  final double width;
  MyAppBar(this.width, {Key? key})
      : super(
          key: key,
          elevation: 4,
          toolbarTextStyle: TextStyle(color: myColors.darkgreen),
          backgroundColor: Colors.white,
          toolbarHeight: 100,
          actions: [
            GestureDetector(
              onTap: () {
                appStateController.changePage(0);
              },
              child: Row(
                children: [
                  SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.fill,
                      )),
                  Container(
                    width: 2,
                    height: 48,
                    color: myColors.darkgreen,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "SANTI\nOVERSEAS",
                    style: TextStyle(
                        color: myColors.darkgreen,
                        letterSpacing: 2,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // getSmartPhoneOrTablet() == phoneType || width < 1275
            //     ? const SizedBox()
            //     :
            Row(
              children: [
                HoverButton(
                    label: "Jobs",
                    onTap: () {
                      appStateController.changePage(1);
                    }),
                HoverButton(
                    label: "Companies",
                    onTap: () {
                      appStateController.changePage(2);
                    }),
                // HoverButton(
                //     label: "Career Advice",
                //     onTap: () {
                //       // appStateController.changePage(3);
                //     }),
                HoverButton(
                    label: "About Us",
                    onTap: () {
                      appStateController.changePage(3);
                    }),
                HoverButton(
                    label: "Login/SignUp",
                    onTap: () async {
                      Get.dialog(Dialog(
                        clipBehavior: Clip.hardEdge,
                        child: SizedBox(
                          width: 300,
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Auth().facebookLogin();
                                },
                                child: Container(
                                  width: 164,
                                  height: 42,
                                  decoration: BoxDecoration(
                                      color: myColors.blue.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Center(
                                      child: Text("SignIn with Facebook")),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Auth().googleLogin();
                                },
                                child: Container(
                                  width: 164,
                                  height: 42,
                                  decoration: BoxDecoration(
                                      color:
                                          myColors.darkgreen.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(16)),
                                  child:
                                      Center(child: Text("SignIn with Google")),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                      // await auth.googleLogin();
                    }),
              ],
            ),
            getSmartPhoneOrTablet() == phoneType || width < 1275
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          html.window.open(
                              'https://freeticketfreevisa.com/admin', "_self");
                        },
                        child: Container(
                          height: 48,
                          width: 132,
                          padding: const EdgeInsets.all(8),
                          child: Center(
                              child: Text("For Employees",
                                  style: TextStyle(
                                      color: myColors.darkgreen,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600))),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          html.window.open(
                              'https://freeticketfreevisa.com/admin', "_self");
                        },
                        child: Container(
                          height: 48,
                          width: 132,
                          padding: const EdgeInsets.all(8),
                          child: Center(
                              child: Text("For Employees",
                                  style: TextStyle(
                                      color: myColors.darkgreen,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600))),
                        ),
                      ),
                    ],
                  )
          ],
        );
}

class HoverButton extends StatefulWidget {
  final String label;
  final Function onTap;
  const HoverButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  Color color = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 164,
      child: InkWell(
        radius: 100,
        splashColor: myColors.darkgreen,
        hoverColor: Colors.black12,
        onHover: (val) {
          log("hovering");
        },
        enableFeedback: true,
        onTap: () {
          widget.onTap();
        },
        child: Center(
            child: Container(
          color: color,
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Text(widget.label,
              style: TextStyle(
                  color: myColors.darkgreen,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
        )),
      ),
    );
  }
}

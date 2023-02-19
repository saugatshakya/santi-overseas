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
                      await auth.facebookLogin();
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
                      SizedBox(
                        width: 92,
                        height: 48,
                        child: GetBuilder<AppStateController>(
                            init: appStateController,
                            builder: (state) {
                              return PopupMenuButton(
                                onSelected: (val) {
                                  appStateController.changeLanguageI(val);
                                },
                                offset: const Offset(0, 48),
                                itemBuilder: (_) => [
                                  const PopupMenuItem(
                                      value: Locale("Nepali", "NE"),
                                      child: Text("Nepali")),
                                  const PopupMenuItem(
                                      value: Locale("English", "EN"),
                                      child: Text("English"))
                                ],
                                child: Container(
                                  width: 92,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    Text(
                                      state.language.languageCode,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: myColors.darkgreen,
                                    )
                                  ]),
                                ),
                              );
                            }),
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
                      SizedBox(
                        width: 92,
                        height: 48,
                        child: GetBuilder<AppStateController>(
                            init: appStateController,
                            builder: (state) {
                              return PopupMenuButton(
                                onSelected: (val) {
                                  appStateController.changeLanguageI(val);
                                },
                                offset: const Offset(0, 48),
                                itemBuilder: (_) => [
                                  const PopupMenuItem(
                                      value: Locale("Nepali", "NE"),
                                      child: Text("Nepali")),
                                  const PopupMenuItem(
                                      value: Locale("English", "EN"),
                                      child: Text("English"))
                                ],
                                child: Container(
                                  width: 92,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    Text(
                                      state.language.languageCode,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: myColors.darkgreen,
                                    )
                                  ]),
                                ),
                              );
                            }),
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

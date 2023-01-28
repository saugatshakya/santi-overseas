import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/app_state_controller.dart';

class MyAppBar extends AppBar {
  final double width;
  MyAppBar(this.width, {Key? key})
      : super(
          key: key,
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarTextStyle: const TextStyle(color: Color(0xff454545)),
          toolbarHeight: 100,
          actions: [
            Container(
                color: Colors.red,
                width: 100,
                height: 100,
                child: Image.asset(
                  "assets/logo.jpeg",
                  fit: BoxFit.fill,
                )),
            const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8.0, 16, 8),
              child: Center(
                child: PopupMenuButton(
                    offset: const Offset(84, 28),
                    itemBuilder: (_) {
                      return [
                        PopupMenuItem(child: Text("Example")),
                        PopupMenuItem(child: Text("Example")),
                        PopupMenuItem(child: Text("Example"))
                      ];
                    },
                    child: const Text(
                      "Jobs",
                      style: TextStyle(color: Color(0xff454545)),
                    )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8.0, 16, 8),
              child: Center(
                  child: Text("Companies",
                      style: TextStyle(color: Color(0xff454545)))),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8.0, 16, 8),
              child: Center(
                  child: Text("Career advice",
                      style: TextStyle(color: Color(0xff454545)))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8.0, 16, 8),
              child: Center(
                child: PopupMenuButton(
                    offset: const Offset(112, 28),
                    itemBuilder: (_) {
                      return [
                        const PopupMenuItem(
                            child: Text("Company Profile",
                                style: TextStyle(color: Color(0xff454545)))),
                        const PopupMenuItem(
                            child: Text("Mission & Values",
                                style: TextStyle(color: Color(0xff454545)))),
                        const PopupMenuItem(
                            child: Text("History",
                                style: TextStyle(color: Color(0xff454545))))
                      ];
                    },
                    child: const Text("About Us",
                        style: TextStyle(color: Color(0xff454545)))),
              ),
            ),
            Spacer(flex: 3),
            const Padding(
                padding: EdgeInsets.fromLTRB(16, 8.0, 8, 8),
                child: Center(
                    child: Text("login/SignUp",
                        style: TextStyle(color: Color(0xff454545))))),
            Container(
              height: 48,
              margin: const EdgeInsets.fromLTRB(8, 8.0, 8, 8),
              padding: const EdgeInsets.all(8),
              child: const Center(
                  child: Text("For Employees",
                      style: TextStyle(color: Color(0xff454545)))),
            ),
            GetBuilder<AppStateController>(
                init: appStateController,
                builder: (state) {
                  return Center(
                    child: PopupMenuButton(
                        onSelected: (val) {
                          appStateController.changeLanguageI(val);
                        },
                        offset: const Offset(0, 48),
                        child: Container(
                          height: 48,
                          margin: const EdgeInsets.fromLTRB(8, 8.0, 16, 8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xff454545))),
                          child: Center(child: Text(state.language.languageCode)),
                        ),
                        itemBuilder: (_) => [
                              const PopupMenuItem(
                                  value: Locale("Nepali", "NE"),
                                  child: Text("Nepali")),
                              const PopupMenuItem(
                                  value: Locale("English", "EN"),
                                  child: Text("English"))
                            ]),
                  );
                })
          ],
        );
}

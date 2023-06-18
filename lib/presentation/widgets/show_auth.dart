import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/data/functions/auth.dart';
import 'package:testapp/data/repo/user_info.dart';
import 'package:testapp/static/colors.dart';

showAuthDialog() {
  String email = "";
  String name = "";
  String phone = "";
  String address = "";
  String password = "";
  bool signUpLoading = false;
  bool loginLoading = false;
  return Get.dialog(StatefulBuilder(
    builder: (context, setState) => Dialog(
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: Get.width * 0.65,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Card(
              child: SizedBox(
                width: Get.width * 0.32,
                height: Get.width * 0.32,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff101010)),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text("Email"),
                      TextField(
                        onChanged: (val) {
                          email = val;
                        },
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Password"),
                      TextField(
                        onChanged: (val) {
                          password = val;
                        },
                        obscureText: true,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (!signUpLoading &&
                              !loginLoading &&
                              email != "" &&
                              password != "") {
                            setState(() {
                              loginLoading = true;
                            });
                            await auth.userLogin(email, password);
                            setState(() {
                              loginLoading = false;
                            });
                          }
                        },
                        child: Container(
                          width: Get.width * .16,
                          height: 40,
                          decoration: BoxDecoration(
                              color: myColors.darkgreen,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: loginLoading
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    "Proceed",
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 132,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: SizedBox(
                width: Get.width * 0.32,
                height: Get.width * 0.32,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SignUp",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff101010)),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text("Name"),
                      TextField(
                        onChanged: (val) {
                          name = val;
                        },
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Email"),
                      TextField(
                        onChanged: (val) {
                          email = val;
                        },
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Phone"),
                      TextField(
                        onChanged: (val) {
                          phone = val;
                        },
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Address"),
                      TextField(
                        onChanged: (value) {
                          address = value;
                        },
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Password"),
                      TextField(
                        onChanged: (val) {
                          password = val;
                        },
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (!signUpLoading &&
                              !loginLoading &&
                              email != "" &&
                              password != "" &&
                              name != "" &&
                              address != "" &&
                              phone != "") {
                            setState(() {
                              signUpLoading = true;
                            });
                            await auth.userSignUp(
                                email, password, phone, name, address);
                            setState(() {
                              signUpLoading = false;
                            });
                          }
                        },
                        child: Container(
                          width: Get.width * .16,
                          height: 40,
                          decoration: BoxDecoration(
                              color: myColors.darkgreen,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: signUpLoading
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    "Proceed",
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        )),
  ));
}

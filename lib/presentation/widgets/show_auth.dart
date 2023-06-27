import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/data/functions/auth.dart';
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
          width: Get.width * 0.8,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Card(
              child: SizedBox(
                width: Get.width * 0.32,
                height: Get.width * 0.32,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff101010)),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text("Email"),
                      TextField(
                        onChanged: (val) {
                          email = val;
                        },
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("Password"),
                      TextField(
                        onChanged: (val) {
                          password = val;
                        },
                        obscureText: true,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(
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
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text(
                                    "Proceed",
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
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
                height: Get.width * 0.4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "SignUp",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff101010)),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text("Name"),
                      TextField(
                        onChanged: (val) {
                          name = val;
                        },
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("Email"),
                      TextField(
                        onChanged: (val) {
                          email = val;
                        },
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("Phone"),
                      TextField(
                        onChanged: (val) {
                          phone = val;
                        },
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("Address"),
                      TextField(
                        onChanged: (value) {
                          address = value;
                        },
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("Password"),
                      TextField(
                        onChanged: (val) {
                          password = val;
                        },
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(
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
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text(
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

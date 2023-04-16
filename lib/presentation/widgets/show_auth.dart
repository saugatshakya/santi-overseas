import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/data/functions/auth.dart';
import 'package:testapp/data/repo/user_info.dart';
import 'package:testapp/static/colors.dart';

showAuthDialog() {
  String info = "";
  return Get.dialog(Dialog(
    clipBehavior: Clip.hardEdge,
    child: SizedBox(
      width: 300,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                info = value;
              },
              decoration: const InputDecoration(
                  labelText: "Enter Email or Phone",
                  border: OutlineInputBorder()),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (info != "") {
                repo.saveUserInfo(info);
                Get.back();
              } else {
                Get.dialog(
                  const Center(
                    child: SizedBox(
                      width: 132,
                      height: 48,
                      child: Center(child: Text("Please Enter Email or Phone")),
                    ),
                  ),
                );
              }
            },
            child: Container(
              width: 84,
              height: 42,
              decoration: BoxDecoration(
                  color: myColors.darkgreen,
                  borderRadius: BorderRadius.circular(32)),
              child: const Center(
                  child: Text(
                "SUBMIT",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              )),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SizedBox(width: 100, child: Divider()),
                Text("or"),
                SizedBox(width: 100, child: Divider())
              ]),
          GestureDetector(
            onTap: () {
              Auth().facebookLogin();
            },
            child: Container(
              width: 164,
              height: 42,
              decoration: BoxDecoration(
                  color: myColors.blue.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(32)),
              child: const Center(child: Text("SignIn with Facebook")),
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
                  color: myColors.darkgreen.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(32)),
              child: const Center(child: Text("SignIn with Google")),
            ),
          ),
        ],
      ),
    ),
  ));
}

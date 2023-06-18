import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:testapp/data/functions/auth.dart";
import "package:testapp/static/colors.dart";

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  int selected = 0;
  String email = "";
  String password = "";
  String confirmPassword = "";
  bool loginLoading = false;
  bool signUpLoading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
          width: width,
          height: height,
          child: width > height
              ? SizedBox(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: SizedBox(
                          width: width * 0.32,
                          height: width * 0.32,
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
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
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
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
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
                                      await auth.employerLogin(email, password);
                                      setState(() {
                                        loginLoading = false;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: width * .16,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: myColors.darkgreen,
                                        borderRadius:
                                            BorderRadius.circular(20)),
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
                                              style: TextStyle(
                                                  color: Colors.white),
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
                          width: width * 0.32,
                          height: width * 0.32,
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
                                const Text("Email"),
                                TextField(
                                  onChanged: (val) {
                                    email = val;
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
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
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text("Confirm Password"),
                                TextField(
                                  onChanged: (val) {
                                    confirmPassword = val;
                                  },
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
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
                                        confirmPassword != "") {
                                      if (confirmPassword == password) {
                                        setState(() {
                                          signUpLoading = true;
                                        });
                                        await auth.employerSignUp(
                                            email, password);
                                        setState(() {
                                          signUpLoading = false;
                                        });
                                      } else {
                                        Get.showSnackbar(const GetSnackBar(
                                          message: "Passwords does not match",
                                          duration: Duration(
                                              milliseconds: 2000),
                                        ));
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: width * 0.16,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: myColors.darkgreen,
                                        borderRadius:
                                            BorderRadius.circular(20)),
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
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        child: SizedBox(
                          width: width * 0.8,
                          height: 332,
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
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
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
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
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
                                      await auth.employerLogin(email, password);
                                      setState(() {
                                        loginLoading = false;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: width * .16,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: myColors.darkgreen,
                                        borderRadius:
                                            BorderRadius.circular(20)),
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
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: SizedBox(
                          width: width * 0.8,
                          height: 400,
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
                                const Text("Email"),
                                TextField(
                                  onChanged: (val) {
                                    email = val;
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
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
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text("Confirm Password"),
                                TextField(
                                  onChanged: (val) {
                                    confirmPassword = val;
                                  },
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
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
                                        confirmPassword != "") {
                                      if (confirmPassword == password) {
                                        setState(() {
                                          signUpLoading = true;
                                        });
                                        await auth.employerSignUp(
                                            email, password);
                                        setState(() {
                                          signUpLoading = false;
                                        });
                                      } else {
                                        Get.showSnackbar(const GetSnackBar(
                                          message: "Passwords does not match",
                                          duration: Duration(
                                              milliseconds: 2000),
                                        ));
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: width * 0.16,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: myColors.darkgreen,
                                        borderRadius:
                                            BorderRadius.circular(20)),
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
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
    ));
  }
}

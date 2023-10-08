import 'dart:convert';
import 'dart:developer';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/data/functions/api.dart';
import 'package:testapp/data/models/company.dart';
import 'package:testapp/data/models/user.dart';
import 'package:testapp/data/repo/user_info.dart';
import 'package:testapp/presentation/my_company.dart';

class Auth {
  // final GoogleSignIn _googleSignIn = GoogleSignIn(
  //   scopes: <String>[
  //     'email',
  //   ],
  // );

  // Future<void> facebookLogin() async {
  //   final LoginResult result = await FacebookAuth.instance.login();
  //   if (result.status == LoginStatus.success) {
  //     final userData =
  //         await FacebookAuth.instance.getUserData(fields: "name,email,picture");
  //     User user = User(email: userData["email"], id: null);
  //     if (user.email == null) {
  //       user.email = "${user.name}santi@gmail.com";
  //       user.email = user.email!.replaceAll(" ", "");
  //     }
  //     appStateController.saveUser(user);
  //     toMyUser(user.name ?? "", user.email ?? "");
  //   } else {
  //     Get.showSnackbar(const GetSnackBar(
  //       message: "Login Failed, Try Again Later",
  //       duration: Duration(milliseconds: 2000),
  //     ));
  //   }
  // }

  // Future<void> googleLogin() async {
  //   GoogleSignInAccount? account = await _googleSignIn.signIn();
  //   if (account != null) {
  //     User user = User(email: account.email, name: account.displayName);
  //     appStateController.saveUser(user);
  //     await toMyUser(user.name ?? "", user.email ?? "");
  //   }
  // }

  toMyUser(String name, email) async {
    repo.saveUserInfo(email);
    // var response = await api.post("login", jsonEncode({"email": email}));
    // if (response.statusCode == 200) {
    //   String token = jsonDecode(response.body)["token"];
    //   log(token);
    // } else {
    // Get.showSnackbar(const GetSnackBar(
    //   message: "Could not log in",
    //   duration: Duration(milliseconds: 2000),
    // ));
    // }
  }

  // googlelogout() {
  //   _googleSignIn.disconnect();
  // }

  employerLogin(String email, String password) async {
    var response = await api.post(
        "employer/login", jsonEncode({"email": email, "password": password}));
    log(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      int? companyId = data["employer_company"];
      String employerId = data["employer_id"].toString();
      CompanyModel? company;
      if (companyId != null) {
        company = await getCompany(companyId.toString());
        log("company ==> ${company!.id}");
      }
      Get.off(() => MyCompany(
            company: company,
            employerId: employerId,
          ));
    } else {
      Get.showSnackbar(const GetSnackBar(
        message: "Could not log in",
        duration: Duration(milliseconds: 2000),
      ));
    }
  }

  Future<CompanyModel?> getCompany(String id) async {
    var response = await api.get("get_company?id=$id");
    if (response != []) {
      CompanyModel company = CompanyModel.fromJson(response, id);
      return company;
    } else {
      return null;
    }
  }

  employerSignUp(String email, String password) async {
    var response = await api.post(
        "employer", jsonEncode({"email": email, "password": password}));
    if (response.statusCode == 200) {
      String employerId = jsonDecode(response.body)["id"].toString();
      Get.off(() => MyCompany(
            company: null,
            employerId: employerId,
          ));
    } else {
      Get.showSnackbar(const GetSnackBar(
        message: "Could not sign in",
        duration: Duration(milliseconds: 2000),
      ));
    }
  }

  userLogin(String email, String password) async {
    var response = await api.post(
        "login_", jsonEncode({"email": email, "password": password}));
    if (response.statusCode == 200) {
      repo.saveUserInfo(email);
      appStateController.saveUser(User(email: email, id: "0", name: "user"));
      Get.back();
    } else {
      Get.showSnackbar(const GetSnackBar(
        message: "Could not log in",
        duration: Duration(milliseconds: 2000),
      ));
    }
  }

  userSignUp(String email, String password, String phone, String name,
      String address) async {
    var response = await api.post(
        "signup",
        jsonEncode({
          "email": email,
          "password": password,
          "address": address,
          "name": name,
          "type": "user",
          "phone": phone
        }));
    log(response.body);
    if (response.statusCode == 200) {
      log("here");
      repo.saveUserInfo(email);
      appStateController.saveUser(User(email: email, id: "0", name: name));
      Get.back();
    } else {
      Get.showSnackbar(const GetSnackBar(
        message: "Could not sign in",
        duration: Duration(milliseconds: 2000),
      ));
    }
  }
}

final Auth auth = Auth();

import 'dart:convert';
import 'dart:developer';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/data/functions/api.dart';
import 'package:testapp/data/models/user.dart';

class Auth {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

  Future<void> facebookLogin() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final userData =
          await FacebookAuth.instance.getUserData(fields: "name,email,picture");
      User user = User(email: userData["email"], id: null);
      if (user.email == null) {
        user.email = "${user.name}dummyMitini@gmail.com";
        user.email = user.email!.replaceAll(" ", "");
      }
      appStateController.saveUser(user);

      toMyUser(user.name ?? "", user.email ?? "");
    } else {
      Get.showSnackbar(const GetSnackBar(
        message: "Login Failed, Try Again Later",
        duration: Duration(milliseconds: 2000),
      ));
    }
  }

  Future<void> googleLogin() async {
    GoogleSignInAccount? account = await _googleSignIn.signIn();
    if (account != null) {
      User user = User(email: account.email, name: account.displayName);
      appStateController.saveUser(user);

      await toMyUser(user.name ?? "", user.email ?? "");
    }
  }

  toMyUser(String name, email) async {
    var response = await api.post("login", jsonEncode({"email": email}));
    if (response.statusCode == 200) {
      String token = jsonDecode(response.body)["token"];
      log(token);
    } else {
      // Get.showSnackbar(const GetSnackBar(
      //   message: "Could not log in",
      //   duration: Duration(milliseconds: 2000),
      // ));
    }
  }

  googlelogout() {
    _googleSignIn.disconnect();
  }
}

final Auth auth = Auth();

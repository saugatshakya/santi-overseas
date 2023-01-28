import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStateController extends GetxController {
  Locale language = const Locale('Nepali', 'NE');

  changeLanguageI(Locale lan) {
    language = lan;
    update();
  }
}

final AppStateController appStateController = Get.put(AppStateController());

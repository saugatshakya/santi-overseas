import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStateController extends GetxController {
  Locale language = const Locale('Nepali', 'NE');
  PageController currentPage = PageController(initialPage: 1);
  String searchCountry = "";
  String searchJob = "";
  final FocusNode seachCountryFocus = FocusNode();
  final FocusNode seachJobFocus = FocusNode();
  int pagination = 1;
  int itemCount = 83;
  int perPageItem = 10;

  changePage(int page) {
    currentPage.jumpToPage(
      page,
    );
    update();
  }

  changeLanguageI(Locale lan) {
    language = lan;
    update();
  }

  changeSearchCountry(val) {
    searchCountry = val;
    update();
  }

  changeSearchJob(val) {
    searchJob = val;
    update();
  }

  changePagination(val) {
    pagination = val;
    update();
  }

  requestFocus(FocusNode node) {
    node.requestFocus();
    update();
  }

  focusOnCountry() {
    seachCountryFocus.requestFocus();
    update();
  }

  focusOnJob() {
    seachJobFocus.requestFocus();
    update();
  }
}

final AppStateController appStateController = Get.put(AppStateController());

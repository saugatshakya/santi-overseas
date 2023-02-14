import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStateController extends GetxController {
  Locale language = const Locale('Nepali', 'NE');
  PageController currentPage = PageController(initialPage: 0);
  String searchCountry = "";
  String searchJob = "";
  final FocusNode seachCountryFocus = FocusNode();
  final FocusNode seachJobFocus = FocusNode();
  //job
  int pagination = 1;
  int itemCount = 83;
  int perPageItem = 9;
  //company
  int paginationC = 1;
  int itemCountC = 57;
  int perPageItemC = 9;

  //demoData

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

  changeCompanyPagination(val) {
    paginationC = val;
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

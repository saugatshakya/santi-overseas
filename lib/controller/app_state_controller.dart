import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/data/models/image.dart';
import 'package:testapp/data/models/job.dart';
import 'package:testapp/data/models/user.dart';

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
  //
  User? user;

  //demoData
  List<JobModel> jobs = [];
  JobModel? selectedJob;
  ImageModel? adImage;
  List<ImageModel> gallery = [];
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

  saveUser(User newUser) {
    user = newUser;
    update();
  }

  updateJobs(List<JobModel> newJobs) {
    jobs = newJobs;
    update();
  }

  updatADImage(ImageModel image) {
    adImage = image;
    update();
  }

  updateGallery(List<ImageModel> newImages) {
    gallery = newImages;
    update();
  }

  selectJob(JobModel job) {
    selectedJob = job;
    update();
  }
}

final AppStateController appStateController = Get.put(AppStateController());

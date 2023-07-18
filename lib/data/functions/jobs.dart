import 'dart:convert';
import 'dart:developer';
import 'dart:math'hide log;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/data/functions/api.dart';
import 'package:testapp/data/models/country.dart';
import 'package:testapp/data/models/image.dart';
import 'package:testapp/data/models/job.dart';
import 'package:testapp/data/models/news.dart';

class JobsApi {
  allJobs() async {
    List<JobModel> jobs = [];
    try {
      var response = await api.get("jobs");
      log("jobs: $response");
      for (var data in response) {
        JobModel job = JobModel.fromJson(data);
        log("required numbers: ${job.applyBefore}");
        jobs.add(job);
      }
    } catch (e) {
      log(e.toString());
    }
    appStateController.updateJobs(jobs);
  }

  getAd() async {
    try {List<ImageModel> images = [];
      var response = await api.get("getImages/advertisement");
      for(int i=0;i<response["images"].length;i++){
      ImageModel image = ImageModel.fromJson(response["images"][i]);
      images.add(image);}
      if(images.isNotEmpty){
        int random = Random().nextInt(images.length);
        showWidget(images[random].imagePath!);
      }
      appStateController.updatADImage(images);
    } catch (e) {
      log(e.toString());
    }
  }

  
  showWidget(String image) async {
    await Future.delayed(const Duration(milliseconds: 500));
    Get.dialog(Dialog(
      child: Stack(children: [
        Image.network("https://freeticketfreevisa.com/$image"),
        Positioned(
            top: 0,
            right: 16,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                width: 32,
                height: 32,
                child: const Center(child: Icon(Icons.close)),
              ),
            ))
      ]),
    ));
  }

  getPopularSearch() async {
    List<String> datas = [];
    try {
      var response = await api.get("popularsearch");
      for (String data in response) {
        datas.add(data);
      }
      log("datas ${datas.length}");
    } catch (e) {
      log(e.toString());
    }
    return datas;
  }

  getCountries() async {
    List datas = [];
    try {
      var response = await api.get("country");
      log("countries: $response");
      for (Map data in response) {
        datas.add({
          "id": data["id"],
          "country": data["name"],
          "code": data["alpha2"].toString().toUpperCase()
        });
      }
    } catch (e) {
      log(e.toString());
    }
    return datas;
  }

  getCompanies() async {
    List<String> datas = [];
    try {
      var response = await api.get("company");
      log(response.toString());
      for (Map data in response) {
        datas.add(data["logo"]);
      }
    } catch (e) {
      log(e.toString());
    }
    appStateController.updateCompanies(datas);
    return datas;
  }

  getGallery() async {
    List<ImageModel> images = [];
    try {
      var response = await api.get("getImages/gallery");
      var responseImages = response["images"];
      for (var data in responseImages) {
        ImageModel image = ImageModel.fromJson(data);
        images.add(image);
      }
    } catch (e) {
      log(e.toString());
    }
    appStateController.updateGallery(images);
  }

  formSubmit(String name, address, phone, email) async {
    List<ImageModel> images = [];
    try {
      var response = await api.post(
          "signup",
          jsonEncode({
            "name": name,
            "phone": phone,
            "address": address,
            "email": email
          }));
      log(response.body.toString());
    } catch (e) {
      log(e.toString());
    }
    appStateController.updateGallery(images);
  }

  apply(jobId) async {
    log("$jobId");
    var response = await api.post(
        "apply?job_id=$jobId&contact_info=${appStateController.user!.email}",
        "");
    if (response.statusCode == 200) {
      Get.dialog(const Dialog(
        child: SizedBox(
          width: 164,
          height: 42,
          child: Center(
            child: Text("Applied Succeddfully"),
          ),
        ),
      ));
    } else {
      Get.dialog(const Dialog(
        child: SizedBox(
          width: 164,
          height: 42,
          child: Center(
            child: Text("Sorry Can't apply to the Job"),
          ),
        ),
      ));
    }
  }

  getNews() async {
    var response = await api.get("get_news");
    List<NewsModel> news = [];
    if (response != null) {
      for (int i = 0; i < response.length; i++) {
        NewsModel neww = NewsModel.fromJson(response[i]);
        news.add(neww);
      }
    }

    return news;
  }

  addCountry(CountryModel country) async {
    try {
      var response = await api.post("country",
          jsonEncode({"name": country.name, "alpha2": country.alpha2}));
      log(response.body.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  addCompany(String name, address, logo, email, phone) async {
    try {
      var response = await api.post(
          "company",
          jsonEncode({
            "name": name,
            "address": address,
            "logo": logo,
            "email": email,
            "contact_number": phone
          }));
      return jsonDecode(response.body)["id"];
    } catch (e) {
      return null;
    }
  }

  assignCompany(String empId, String compId) async {
    try {
      var response = await api.put(
          "employer?employer_id=$empId", jsonEncode({"company_id": compId}));
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  addJob(
      {String? title,
      String? category,
      String? description,
      String? requirement,
      String? minQualification,
      String? requiredNum,
      String? hoursPDay,
      String? hoursPWeek,
      String? minExp,
      String? salary,
      bool? accomodation,
      bool? food,
      bool? overTime,
      String? annualVacation,
      String? otherBenefit,
      String? companyId,
      String? applyBefore,
      String? contractPeriod,
      String? country}) async {
    try {
      var response = await api.post(
          "jobs",
          jsonEncode({
            "title": title,
            "required_numbers": requiredNum,
            "category": category,
            "working_hours_per_day": hoursPDay,
            "working_days_per_week": hoursPWeek,
            "description": description,
            "min_qualification": minQualification,
            "min_experience": minExp,
            "other_benefits": otherBenefit,
            "salary": salary,
            "accommodation": accomodation,
            "food": food,
            "annual_vacation": annualVacation,
            "over_time": overTime,
            "company": companyId,
            "apply_before": applyBefore,
            "contract_period": contractPeriod,
            "country": country
          }));
      log(response.body);
      return true;
    } catch (e) {
      log("Error with $e");
      return null;
    }
  }
}

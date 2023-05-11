import 'dart:convert';
import 'dart:developer';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/data/functions/api.dart';
import 'package:testapp/data/models/company.dart';
import 'package:testapp/data/models/image.dart';
import 'package:testapp/data/models/job.dart';
import 'package:testapp/data/models/news.dart';

class JobsApi {
  allJobs() async {
    List<JobModel> jobs = [];
    try {
      var response = await api.get("jobs");
      for (var data in response) {
        JobModel job = JobModel.fromJson(data);
        log("required numbers: " + job.requiredNumbers.toString());
        jobs.add(job);
      }
    } catch (e) {
      log(e.toString());
    }
    appStateController.updateJobs(jobs);
  }

  getAd() async {
    try {
      var response = await api.get("getImages/advertisement");
      ImageModel image = ImageModel.fromJson(response["images"][0]);
      appStateController.updatADImage(image);
    } catch (e) {
      log(e.toString());
    }
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
      for (Map data in response) {
        datas.add({
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

  apply(jobId, contactInfo) async {
    var response =
        await api.post("apply", "job_id=$jobId&contact_info=$contactInfo");
    log(response.body.toString());
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
}

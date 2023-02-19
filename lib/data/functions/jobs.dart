import 'dart:developer';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/data/functions/api.dart';
import 'package:testapp/data/models/image.dart';
import 'package:testapp/data/models/job.dart';

class JobsApi {
  allJobs() async {
    List<JobModel> jobs = [];
    try {
      var response = await api.get("jobs");
      for (var data in response) {
        JobModel job = JobModel.fromJson(data);
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
      log(response.toString());
    } catch (e) {
      log(e.toString());
    }
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
}

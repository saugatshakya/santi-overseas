import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/data/functions/jobs.dart';
import 'package:testapp/presentation/about_us.dart';
import 'package:testapp/presentation/companies.dart';
import 'package:testapp/presentation/job.dart';
import 'package:testapp/presentation/jobs.dart';
import 'package:testapp/presentation/main_page.dart';

import 'package:testapp/presentation/widgets/my_appbar.dart';

import 'package:testapp/static/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map> countryCheckBox = [
    {"country": "Qatar", "code": FlagsCode.QA},
    {"country": "Malaysia", "code": FlagsCode.MY},
    {"country": "Saudi", "code": FlagsCode.SA},
    {"country": "kuwait", "code": FlagsCode.KW},
    {"country": "Dubai", "code": FlagsCode.AE},
  ];
  List questions = [
    "What is free visa and free ticket program?",
    "Is this truly the ZERO cost program?",
    "What does this ZERO cost include?",
    "Will the company deduct all these above mentioned costs from the salary?"
  ];
  List answers = [
    "It is the visa system sanctioned by the employer bearing all the processing cost of the employees.",
    "Of course, this is indeed the ZERO cost program.",
    "ZERO cost / Free of cost includes the following entities:\nPassport cost NPR 5000.00\nTraveling, lodging and fooding cost for interview\nMedical cost\nVisa cost\nInsurance and welfare cost\nOne-way travel cost to Kathmandu for flight\nTicket cost",
    "Sorry, no cost shall be deducted since this is free of cost program."
  ];
  List companies = [
    "assets/company.jpg",
    "assets/company_1.jpg",
    "assets/company_2.jpg",
    "assets/company_3.jpg",
    "assets/company_4.jpg",
    "assets/company_5.jpg"
  ];
  @override
  void initState() {
    JobsApi().allJobs();
    JobsApi().getAd();
    JobsApi().getGallery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<AppStateController>(
        init: appStateController,
        builder: (state) {
          return Scaffold(
              backgroundColor: myColors.blue,
              appBar: MyAppBar(width),
              body: SizedBox(
                width: width,
                height: height,
                child: PageView(
                    controller: state.currentPage,
                    pageSnapping: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      MainPage(
                          height: height,
                          width: width,
                          countryCheckBox: countryCheckBox,
                          companies: companies,
                          questions: questions,
                          answers: answers),
                      const Jobs(),
                      const Companies(),
                      const AboutUs(),
                      state.selectedJob == null
                          ? const SizedBox()
                          : Job(job: state.selectedJob!)
//                         Container(
//                           color: Colors.green,
//                         )
                    ]),
              ));
        });
  }
}

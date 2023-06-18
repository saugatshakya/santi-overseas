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
  List countryCheckBox = [];
  List questions = [
    "What is free visa and  ticket program?",
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
  List nepaliQ = [
    'फ्रि भिसा, फ्रि टिकट कार्यक्रम भन्नाले के बुझिन्छ ?',
    'के यो वास्तवमा शुन्य लागत अर्थात पूर्ण निशुल्क को कार्यक्रम नै हो त?',
    'शुन्य लागत अर्थात पूर्ण निशुल्क भित्र कुन कुन सेवाहरु पर्दछन्?',
    'के यी माथि उल्लेखित खर्चहरु कम्पनिले कामदारहरुको तलबबाट कटाउनेछ?'
  ];
  List nepaliA = [
    'रोजगारदाताले आफ्नो कम्पनिमा काम गर्न आउन चाहने कामदारहरुलाई उक्त प्रक्रियाको लागि आवश्यक पर्ने सम्पूर्ण खर्च बेहोर्ने गरी लागु गरिएको भिसा प्रणाली हो भन्ने बुझिन्छ ।',
    'अवश्य, यो कार्यक्रम वास्तवमै शुन्य लागत अर्थात पूर्ण निशुल्क को कार्यक्रम हो ।',
    'शुन्य लागत अर्थात पूर्ण निशुल्क भित्र निम्नानुसारका सेवाहरु पर्दछन्:\nराहदानी खर्च ने.रु. ५०००।– \nअन्तरवार्ताको लागि आउँदा लाग्ने यातायात, बस्ने र खाने खर्च\nमेडिकल गर्ने खर्च\nभिषाको लागि लाग्ने खर्च\nबिमा तथा अन्य कल्याणकारी खर्च\nहवाई को समयमा घरदेखि काठमाडौं सम्मको यातायात खर्च\nविदेशजाने हवाई टिकट',
    'के यी माथि उल्लेखित खर्चहरु कम्पनिले कामदारहरुको तलबबाट कटाउनेछ?माफ गर्नुहोला, जब यो कार्यक्रम नै निशुल्क भन्ने छ, खर्च कटाउने त प्रश्नै उठ्दैन नी, धन्यवाद ।, '
  ];
  List searches = [];
  List companies = [];
  List news = [];
  showDialod() async {
    JobsApi().allJobs();
    JobsApi().getAd();
    countryCheckBox = await JobsApi().getCountries();
    companies = await JobsApi().getCompanies();
    searches = await JobsApi().getPopularSearch();
    news = await JobsApi().getNews();
    setState(() {});
    JobsApi().getGallery();
  }

  @override
  void initState() {
    showDialod();

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
                height: height - 48,
                child: PageView(
                    controller: state.currentPage,
                    pageSnapping: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      MainPage(
                          searches: searches,
                          height: height,
                          width: width,
                          countryCheckBox: countryCheckBox,
                          companies: companies,
                          questions: state.language == const Locale('ne', 'NE')
                              ? nepaliQ
                              : questions,
                          answers: state.language == const Locale('ne', 'NE')
                              ? nepaliA
                              : answers,
                          news: news),
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

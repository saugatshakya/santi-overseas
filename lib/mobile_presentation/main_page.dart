import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/data/functions/jobs.dart';
import 'package:testapp/data/models/news.dart';
import 'package:testapp/mobile_presentation/about.dart';
import 'package:testapp/mobile_presentation/job.dart';
import 'package:testapp/presentation/main_page.dart';
import 'package:testapp/presentation/widgets/company_logo.dart';
import 'package:testapp/presentation/widgets/country_selector.dart';
import 'package:testapp/presentation/widgets/news.dart';
import 'package:testapp/presentation/widgets/pagination.dart';
import 'package:testapp/presentation/widgets/raised_button.dart';
import 'package:testapp/presentation/widgets/searchlist.dart';
import 'package:testapp/static/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:testapp/mobile_presentation/job_detail.dart';
import 'package:testapp/static/data.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
        init: appStateController,
        builder: (state) {
          return Scaffold(
            body: InteractiveViewer(
              child: SafeArea(
                  child: PageView(
                allowImplicitScrolling: false,
                physics: const NeverScrollableScrollPhysics(),
                controller: state.currentPage,
                children: [
                  const Default(),
                  const Jobs(),
                  const Companies(),
                  const AboutUsMobile(),
                  Container(
                    color: Colors.red,
                  ),
                  state.selectedJob == null
                      ? const SizedBox()
                      : JobDetail(job: state.selectedJob!)
                ],
              )),
            ),
          );
        });
  }
}

class Default extends StatefulWidget {
  const Default({super.key});

  @override
  State<Default> createState() => _DefaultState();
}

class _DefaultState extends State<Default> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  List countryCheckBox = [];
  List questions = [
    "question1".tr,
    "question2".tr,
    "question3".tr,
    "question4".tr
  ];
  List answers = ["answer1".tr, "answer2".tr, "answer3".tr, "answer4".tr];
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
  List<NewsModel> news = [];
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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
        init: appStateController,
        builder: (state) => Container(
              height: Get.height,
              decoration: BoxDecoration(
                  color: myColors.white.withOpacity(0.9),
                  image: const DecorationImage(
                      image: AssetImage("assets/bg.jpg"),
                      repeat: ImageRepeat.repeat,
                      opacity: 0.4)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/17278525.png"),
                              opacity: 0.3,
                              fit: BoxFit.cover),
                          gradient: LinearGradient(
                              colors: [myColors.darkgreen, myColors.lightgreen],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 64,
                          ),
                          Text(
                            "Find the best work at foreign employment through SANTI OVERSEAS."
                                .tr,
                            style: GoogleFonts.ptSerif(
                                color: myColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Fill up your profile to get your dream job.".tr,
                            style: GoogleFonts.ptSerif(
                                color: myColors.white, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 48,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SearchableTextField(
                                  suggestions: const [
                                    "aag",
                                    "bage",
                                    "chaeh",
                                    "dawt"
                                  ],
                                  label: "Jobs, Title, Keywords or Company",
                                  icon: Icons.search,
                                  width: MediaQuery.of(context).size.width,
                                  focusNode: state.seachCountryFocus,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                SearchableTextField(
                                  suggestions: const [
                                    "Dharan",
                                    "Kathmandu",
                                    "Pokhara",
                                    "Ithari"
                                  ],
                                  label: "Area, City, Town, Country",
                                  icon: Icons.location_on,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  focusNode: state.seachJobFocus,
                                ),
                                // const SearchButton()
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 48,
                          ),
                          Divider(
                            height: 0,
                            thickness: 2,
                            color: myColors.white,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          if (countryCheckBox.isNotEmpty)
                            ScrollWidget(
                                reverse: false,
                                height: 100,
                                stop: false,
                                direction: Axis.horizontal,
                                widget: (context, i) => GestureDetector(
                                      onTap: () {},
                                      child: CountrySelector(
                                        country: countryCheckBox[i %
                                            countryCheckBox.length]["country"],
                                        code: countryCheckBox[
                                            i % countryCheckBox.length]["code"],
                                      ),
                                    )),
                          if (countryCheckBox.isNotEmpty)
                            const SizedBox(
                              height: 16,
                            ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 0,
                      thickness: 2,
                      color: myColors.darkgreen,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (companies.isNotEmpty)
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.fromLTRB(32, 8, 8, 8),
                        child: Center(
                          child: Text("TOP COMPANIES",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: myColors.darkgreen)),
                        ),
                      ),
                    if (companies.isNotEmpty)
                      const SizedBox(
                        height: 16,
                      ),
                    if (companies.isNotEmpty)
                      ScrollWidget(
                          reverse: true,
                          height: 100,
                          stop: false,
                          direction: Axis.horizontal,
                          widget: (context, i) => GestureDetector(
                                onTap: () {},
                                child: CompanyLogo(
                                    imageLink: companies[i % companies.length]),
                              )),
                    if (companies.isNotEmpty)
                      const SizedBox(
                        height: 32,
                      ),
                    if (companies.isNotEmpty)
                      Divider(
                        height: 0,
                        thickness: 2,
                        color: myColors.darkgreen,
                      ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: myColors.darkgreen,
                      width: Get.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "How Can We Help You?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _name,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  labelText: "Full Name *",
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _address,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  labelText: "Address *",
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _contact,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  labelText: "Contact no *",
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _email,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  labelText: "Email *",
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          RaisedButton(
                              label: "SUBMIT",
                              height: 42,
                              width: 132,
                              fontSize: 18,
                              onTap: () async {
                                if (_name.text.isEmpty ||
                                    _address.text.isEmpty ||
                                    _contact.text.isEmpty ||
                                    _email.text.isEmpty) {
                                  Get.dialog(const Dialog(
                                    child: SizedBox(
                                      width: 164,
                                      height: 42,
                                      child: Center(
                                        child:
                                            Text("Please Fill All The Details"),
                                      ),
                                    ),
                                  ));
                                } else {
                                  await JobsApi().formSubmit(
                                      _name.text,
                                      _address.text,
                                      _contact.text,
                                      _email.text);
                                  _name.clear();
                                  _address.clear();
                                  _email.clear();
                                  _contact.clear();
                                  Get.dialog(const Dialog(
                                    child: SizedBox(
                                      width: 164,
                                      height: 42,
                                      child: Center(
                                        child: Text("Submitted Successfully"),
                                      ),
                                    ),
                                  ));
                                }
                              },
                              color: myColors.blue)
                        ],
                      ),
                    ),
                    Container(
                      color: myColors.darkgreen.withOpacity(0.32),
                      width: Get.width,
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 32,
                          ),
                          Text("FAQs",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: myColors.white)),
                          const SizedBox(
                            height: 32,
                          ),
                          ScrolllVerticle(
                              widget: (context, i) => Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 32,
                                            child: Text(
                                              "${i % questions.length + 1}  ${questions[i % questions.length]}",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: myColors.darkgreen,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 68,
                                            child: Text(
                                              "→ ${answers[i % answers.length]}",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: myColors.darkgreen,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                              direction: Axis.vertical,
                              height: 354),
                        ],
                      ),
                    ),
                    Container(
                      color: myColors.darkgreen.withOpacity(0.32),
                      width: Get.width,
                      height: 464,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 32,
                          ),
                          Text("News",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: myColors.white)),
                          const SizedBox(
                            height: 32,
                          ),
                          NewsScroll(
                            widget: (context, i) => News(
                              news: news[i % news.length],
                            ),
                            direction: Axis.horizontal,
                            height: 300,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("TESTIMONIALS",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: myColors.darkgreen)),
                    ),
                    SizedBox(
                      width: Get.width * 0.62,
                      child: Divider(
                        height: 0,
                        thickness: 2,
                        color: myColors.darkgreen,
                      ),
                    ),
                    SizedBox(
                      height: 500,
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Get.width * 0.5 - 0.5,
                            child: ScrolllVerticle(
                              widget: (context, i) {
                                if (i % 2 == 0) {
                                  return SizedBox(
                                    width: Get.width * 0.5 - 0.5,
                                    height: 132,
                                    child: Row(children: [
                                      Container(
                                          width: Get.width * 0.5 - 0.5 - 16,
                                          height: 132,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: myColors.white,
                                            border: Border.all(
                                                width: 0.5,
                                                color: myColors.darkgreen),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: ListTile(
                                            leading: Container(
                                              width: 16,
                                              height: 16,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.yellow),
                                            ),
                                            minLeadingWidth: 0,
                                            title: Text(
                                                testimony[i % testimony.length]
                                                    .name),
                                            subtitle: SizedBox(
                                              width: Get.width * 0.5 - 0.5 - 16,
                                              height: 92,
                                              child: Text(testimony[
                                                      i % testimony.length]
                                                  .data),
                                            ),
                                          )),
                                      Container(
                                        width: 16,
                                        height: 1,
                                        color: myColors.darkgreen,
                                      ),
                                    ]),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              },
                              direction: Axis.vertical,
                              height: 500,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 500,
                            color: myColors.darkgreen,
                          ),
                          SizedBox(
                            width: Get.width * 0.5 - 0.5,
                            child: ScrolllVerticle(
                              widget: (context, i) {
                                if (i % 2 != 0) {
                                  return SizedBox(
                                    width: Get.width * 0.5 - 0.5,
                                    height: 132,
                                    child: Row(children: [
                                      Container(
                                        width: 16,
                                        height: 1,
                                        color: myColors.darkgreen,
                                      ),
                                      Container(
                                          width: Get.width * 0.5 - 0.5 - 16,
                                          height: 132,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: myColors.white,
                                            border: Border.all(
                                                width: 0.5,
                                                color: myColors.darkgreen),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: ListTile(
                                            leading: Container(
                                              width: 16,
                                              height: 16,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.yellow),
                                            ),
                                            title: Text(
                                                testimony[i % testimony.length]
                                                    .name),
                                            minLeadingWidth: 0,
                                            subtitle: SizedBox(
                                              width: Get.width * 0.5 - 0.5 - 16,
                                              height: 92,
                                              child: Text(testimony[
                                                      i % testimony.length]
                                                  .data),
                                            ),
                                          ))
                                    ]),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              },
                              direction: Axis.vertical,
                              height: 500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.62,
                      child: Divider(
                        height: 0,
                        thickness: 2,
                        color: myColors.darkgreen.withOpacity(0.4),
                      ),
                    ),
                    if (state.gallery.isNotEmpty)
                      Container(
                        color: myColors.darkgreen.withOpacity(0.3),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text("GALLERY",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: myColors.white)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            ScrollWidget(
                                reverse: false,
                                widget: (context, i) => GalleryImage(
                                      path: state
                                          .gallery[i % state.gallery.length]
                                          .imagePath!,
                                    ),
                                direction: Axis.horizontal,
                                height: 132),
                          ],
                        ),
                      ),
                    Image.asset("assets/team.png"),
                    Container(
                      color: myColors.blue.withOpacity(0.4),
                      width: Get.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text("Find Us On Social Media",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: myColors.darkgreen)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                            child: SizedBox(
                              width: Get.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Chip(
                                      backgroundColor: const Color(0xff4267B2),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      label: const Text(
                                        "Facebook",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  Chip(
                                      backgroundColor: const Color(0xff00acee),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      label: const Text(
                                        "Twitter",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  Chip(
                                      backgroundColor: const Color(0xffd62976),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      label: const Text(
                                        "Instagram",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  Chip(
                                      backgroundColor: const Color(0xffFF0000),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      label: const Text(
                                        "YouTube",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  Chip(
                                      backgroundColor: const Color(0xffff0050),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      label: const Text(
                                        "TikTok",
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12.0, 16, 12, 0),
                            child: Text("Subscribe to our news letter",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: myColors.darkgreen)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width - 108,
                                  height: 54,
                                  child: TextField(
                                    style: TextStyle(color: myColors.darkgreen),
                                    cursorColor: myColors.darkgreen,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: myColors.lightgreen)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: myColors.darkgreen)),
                                      labelText: "Email",
                                      labelStyle:
                                          TextStyle(color: myColors.darkgreen),
                                      floatingLabelStyle: TextStyle(
                                        color: myColors.blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        backgroundColor: myColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  width: 72,
                                  height: 54,
                                  decoration: BoxDecoration(
                                      color: myColors.blue,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: const Center(
                                    child: Text(
                                      "Subscribe",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: myColors.lightgreen,
                      width: Get.width,
                      height: 164,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12.0, 4, 12, 4),
                                child: Text("Contact Us: Santi OverSeas",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: myColors.white)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12.0, 4, 12, 4),
                                child: Text("Telephone: 9810479710",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: myColors.white)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12.0, 4, 12, 4),
                                child: Text("Email: santioverseas@gmail.com",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: myColors.white)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12.0, 4, 12, 4),
                                child: Text("Location: xyz",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: myColors.white)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Image.asset("assets/map.png"))),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Uri url = Uri.parse(
                            "https://freeticketfreevisa.com/privacypolicy");
                        launchUrl(url);
                      },
                      child: Container(
                        width: Get.width,
                        height: 32,
                        color: myColors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                                "Copyright © ${DateTime.now().year} Santi OverSeas Pvt.Ltd"),
                            const Text("Privacy Policy")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}

class ScrollWidget extends StatefulWidget {
  final Widget? Function(BuildContext, int) widget;
  final Axis direction;
  final double height;
  final bool reverse;
  final bool stop;
  const ScrollWidget(
      {super.key,
      required this.widget,
      required this.direction,
      required this.height,
      required this.reverse,
      this.stop = true});

  @override
  State<ScrollWidget> createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget> {
  Timer? focusChanger;

  final PageController _controller = PageController(viewportFraction: 0.48);
  loop() async {
    focusChanger = Timer.periodic(
        Duration(milliseconds: widget.stop ? 4000 : 3000), (timer) {
      _controller.nextPage(
          duration: Duration(milliseconds: widget.stop ? 1000 : 3000),
          curve: Curves.linear);
    });
  }

  @override
  void initState() {
    loop();
    super.initState();
  }

  @override
  void dispose() {
    focusChanger!.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: PageView.builder(
          reverse: widget.reverse,
          scrollDirection: widget.direction,
          controller: _controller,
          itemBuilder: widget.widget),
    );
  }
}

class ScrolllVerticle extends StatefulWidget {
  final Widget? Function(BuildContext, int) widget;
  final Axis direction;
  final double height;
  const ScrolllVerticle(
      {super.key,
      required this.widget,
      required this.direction,
      required this.height});

  @override
  State<ScrolllVerticle> createState() => _ScrollVerticalWidgetState();
}

class _ScrollVerticalWidgetState extends State<ScrolllVerticle> {
  Timer? focusChanger;

  final PageController _controller = PageController(viewportFraction: 0.4);
  loop() async {
    focusChanger = Timer.periodic(const Duration(milliseconds: 4000), (timer) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInSine);
    });
  }

  @override
  void initState() {
    loop();
    super.initState();
  }

  @override
  void dispose() {
    focusChanger!.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: widget.direction,
          controller: _controller,
          itemBuilder: widget.widget),
    );
  }
}

class Jobs extends StatefulWidget {
  const Jobs({super.key});

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
        init: appStateController,
        builder: (state) => SizedBox(
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "All jobs",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: myColors.darkgreen),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Page ${state.pagination} of ${state.jobs.length} Jobs",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: myColors.darkgreen),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: Wrap(
                          children: [
                            for (int i = ((state.pagination - 1) * 3);
                                i <
                                    (state.pagination * 3 > state.jobs.length
                                        ? state.jobs.length
                                        : state.pagination * 3);
                                i++)
                              JobListingMobile(job: state.jobs[i]),
                            // const Spacer(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      NumberPagination(
                        onPageChanged: (int pageNumber) {
                          //do somthing for selected page
                          setState(() {
                            state.changePagination(pageNumber);
                          });
                        },
                        pageTotal: (state.jobs.length / 3).ceil(),
                        pageInit: state.pagination,
                        threshold: 6,
                        iconNext: Material(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          color: Colors.grey[200],
                          child: const SizedBox(
                            width: 32,
                            height: 32,
                            child:
                                Center(child: Icon(Icons.keyboard_arrow_right)),
                          ),
                        ),
                        iconPrevious: Material(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          color: Colors.grey[200],
                          child: const SizedBox(
                            width: 32,
                            height: 32,
                            child:
                                Center(child: Icon(Icons.keyboard_arrow_left)),
                          ),
                        ),
                      ),
                    ]),
              ),
            ));
  }
}

class Companies extends StatefulWidget {
  const Companies({super.key});

  @override
  State<Companies> createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
        init: appStateController,
        builder: (state) => Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 164,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/17278525.png"),
                          opacity: 0.3,
                          fit: BoxFit.cover),
                      gradient: LinearGradient(
                          colors: [myColors.darkgreen, myColors.lightgreen],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                  child: Text(
                    "Companies",
                    style: TextStyle(fontSize: 32, color: myColors.white),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "All companies",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: myColors.darkgreen),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Page ${state.paginationC} of ${state.companies.length} Companies",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: myColors.darkgreen),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: Wrap(
                            // alignment: WrapAlignment.spaceEvenly,
                            // runAlignment: WrapAlignment.spaceEvenly,
                            // crossAxisAlignment: WrapCrossAlignment.center,
                            // spacing: 12,
                            // runSpacing: 12,
                            children: [
                              for (int i = ((state.paginationC - 1) *
                                      state.perPageItemC);
                                  i <
                                      (state.paginationC * state.perPageItemC <
                                              state.companies.length
                                          ? state.paginationC *
                                              state.perPageItemC
                                          : state.companies.length);
                                  i++)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: CompanyLogo(
                                          imageLink: state.companies[i])),
                                ),
                              // const Spacer(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        NumberPagination(
                          onPageChanged: (int pageNumber) {
                            //do somthing for selected page
                            setState(() {
                              state.changeCompanyPagination(pageNumber);
                            });
                          },
                          pageTotal:
                              (state.companies.length / state.perPageItemC)
                                  .ceil(),
                          pageInit: state.paginationC,
                          threshold: 6,
                          iconNext: Material(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            color: Colors.grey[200],
                            child: const SizedBox(
                              width: 32,
                              height: 32,
                              child: Center(
                                  child: Icon(Icons.keyboard_arrow_right)),
                            ),
                          ),
                          iconPrevious: Material(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            color: Colors.grey[200],
                            child: const SizedBox(
                              width: 32,
                              height: 32,
                              child: Center(
                                  child: Icon(Icons.keyboard_arrow_left)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }
}

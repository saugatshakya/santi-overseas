import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/data/functions/jobs.dart';
import 'package:testapp/data/models/job.dart';
import 'package:testapp/presentation/widgets/company_logo.dart';
import 'package:testapp/presentation/widgets/country_selector.dart';
import 'package:testapp/presentation/widgets/main_table.dart';
import 'package:testapp/presentation/widgets/news.dart';
import 'package:testapp/presentation/widgets/raised_button.dart';
import 'package:testapp/presentation/widgets/scroll_widget.dart';
import 'package:testapp/presentation/widgets/search.dart';
import 'package:testapp/presentation/widgets/searches.dart';
import 'package:testapp/presentation/widgets/searchlist.dart';
import 'package:testapp/static/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:testapp/static/data.dart';

class MainPage extends StatefulWidget {
  MainPage(
      {super.key,
      required this.height,
      required this.width,
      required this.countryCheckBox,
      required this.companies,
      required this.questions,
      required this.answers,
      required this.searches,
      required this.news});
  final double height;
  final double width;
  final List countryCheckBox;
  final List companies;
  final List questions;
  final List answers;
  final List searches;
  final List news;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _name = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _address = TextEditingController();

  final TextEditingController _contact = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
        init: appStateController,
        builder: (state) {
          return SafeArea(
              child: Container(
                  height: widget.height - 48,
                  width: widget.width,
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
                                  colors: [
                                    myColors.darkgreen,
                                    myColors.lightgreen
                                  ],
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
                                    fontSize: 48,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Fill up your profile to get your dream job."
                                    .tr,
                                style: GoogleFonts.ptSerif(
                                    color: myColors.white, fontSize: 28),
                              ),
                              const SizedBox(
                                height: 64,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SearchableTextField(
                                    suggestions: const [],
                                    label: "Jobs, Title, Keywords or Company",
                                    icon: Icons.search,
                                    width: 400,
                                    focusNode: state.seachCountryFocus,
                                    onChanged: (val) {
                                      appStateController.changeSearchJob(val);
                                    },
                                  ),
                                  SearchableTextField(
                                    suggestions: const [],
                                    onChanged: (val) {
                                      appStateController
                                          .changeSearchCountry(val);
                                    },
                                    label: "Area, City, Town, Country",
                                    icon: Icons.location_on,
                                    width: 250,
                                    focusNode: state.seachJobFocus,
                                  ),
                                  SearchButton(
                                    onTap: () {
                                      log("here");
                                      List<JobModel> jobs = [];
                                      if (appStateController.searchJob != "") {
                                        List<JobModel> newJobs = appStateController
                                            .jobs
                                            .where((element) =>
                                                (element.title != null &&
                                                    element.title!
                                                        .toLowerCase()
                                                        .contains(
                                                            appStateController
                                                                .searchJob
                                                                .toLowerCase())) ||
                                                (element.category != null &&
                                                    element.category!
                                                        .toLowerCase()
                                                        .contains(
                                                            appStateController
                                                                .searchJob
                                                                .toLowerCase())))
                                            .toList();
                                        jobs = jobs + newJobs;
                                      }
                                      if (appStateController.searchCountry !=
                                          "") {
                                        List<JobModel> newJobs =
                                            appStateController.jobs
                                                .where((element) =>
                                                    element.country != null &&
                                                    element.country!.name !=
                                                        null &&
                                                    element.country!.name!
                                                        .toLowerCase()
                                                        .contains(
                                                            appStateController
                                                                .searchCountry
                                                                .toLowerCase()))
                                                .toList();
                                        jobs = jobs + newJobs;
                                      }

                                      appStateController.updateJobs(jobs);
                                      appStateController.changePage(1);
                                    },
                                  )
                                ],
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
                              if (widget.countryCheckBox.isNotEmpty)
                                ScrollWidget(
                                    reverse: false,
                                    height: 100,
                                    stop: false,
                                    direction: Axis.horizontal,
                                    widget: (context, i) => GestureDetector(
                                          onTap: () {},
                                          child: CountrySelector(
                                            country: widget.countryCheckBox[i %
                                                widget.countryCheckBox
                                                    .length]["country"],
                                            code: widget.countryCheckBox[i %
                                                widget.countryCheckBox
                                                    .length]["code"],
                                          ),
                                        )),
                              if (widget.countryCheckBox.isNotEmpty)
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
                        if (widget.companies.isNotEmpty)
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
                        if (widget.companies.isNotEmpty)
                          const SizedBox(
                            height: 16,
                          ),
                        if (widget.companies.isNotEmpty)
                          ScrollWidget(
                              reverse: true,
                              height: 100,
                              stop: false,
                              direction: Axis.horizontal,
                              widget: (context, i) => GestureDetector(
                                    onTap: () {},
                                    child: CompanyLogo(
                                        imageLink: widget.companies[
                                            i % widget.companies.length]),
                                  )),
                        if (widget.companies.isNotEmpty)
                          const SizedBox(
                            height: 32,
                          ),
                        if (widget.companies.isNotEmpty)
                          Divider(
                            height: 0,
                            thickness: 2,
                            color: myColors.darkgreen,
                          ),
                        Row(
                          children: [
                            SizedBox(
                              width: widget.width * 0.5 - 16,
                              height: 280,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 64.0),
                                    child: Text("ZERO COST",
                                        style: TextStyle(
                                            textBaseline:
                                                TextBaseline.ideographic,
                                            fontSize: 132,
                                            fontWeight: FontWeight.w600,
                                            color: myColors.blue)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 64.0),
                                    child: Text("RECRUITMENT",
                                        style: TextStyle(
                                            fontSize: 84,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 8,
                                            color: myColors.blue)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              color: myColors.darkgreen,
                              width: widget.width * 0.5,
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
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                          labelText: "Full Name *",
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: _address,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                          labelText: "Address *",
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: _contact,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                          labelText: "Contact no *",
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: _email,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                          labelText: "Email *",
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white))),
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
                                                child: Text(
                                                    "Please Fill All The Details"),
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
                                                child: Text(
                                                    "Submitted Successfully"),
                                              ),
                                            ),
                                          ));
                                        }
                                      },
                                      color: myColors.blue)
                                ],
                              ),
                            )
                          ],
                        ),
                        Divider(
                          height: 0,
                          thickness: 2,
                          color: myColors.darkgreen,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const MainTable(),
                        Divider(
                          height: 0,
                          thickness: 2,
                          color: myColors.darkgreen,
                        ),
                        if (widget.searches.isNotEmpty)
                          const SizedBox(
                            height: 16,
                          ),
                        if (widget.searches.isNotEmpty)
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.fromLTRB(32, 8, 8, 8),
                            child: Center(
                              child: Text("POPULAR SEARCHES",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: myColors.darkgreen)),
                            ),
                          ),
                        if (widget.searches.isNotEmpty)
                          const SizedBox(
                            height: 16,
                          ),
                        if (widget.searches.isNotEmpty)
                          ScrollWidget(
                              reverse: false,
                              widget: (context, i) => Searches(
                                  search: widget
                                      .searches[i % widget.searches.length]),
                              direction: Axis.horizontal,
                              height: 64),
                        if (widget.searches.isNotEmpty)
                          const SizedBox(
                            height: 32,
                          ),
                        Divider(
                          height: 0,
                          thickness: 2,
                          color: myColors.darkgreen,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage("assets/bg.jpg"),
                                  opacity: 0.5,
                                  repeat: ImageRepeat.repeat),
                              color: myColors.darkgreen.withOpacity(0.8)),
                          height: 464,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: widget.width * 0.42,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 32,
                                    ),
                                    Text("FAQs".tr,
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
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 32,
                                                      child: Text(
                                                        "${i % widget.questions.length + 1}  ${widget.questions[i % widget.questions.length]}",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: myColors
                                                              .darkgreen,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 68,
                                                      child: Text(
                                                        "→ ${widget.answers[i % widget.answers.length]}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: myColors
                                                              .darkgreen,
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
                              SizedBox(
                                width: widget.width * 0.42,
                                height: 464,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 32,
                                    ),
                                    Text("News".tr,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: myColors.white)),
                                    const SizedBox(
                                      height: 32,
                                    ),
                                    NewsScroll(
                                      widget: (context, i) => News(
                                          news: widget
                                              .news[i % widget.news.length]),
                                      direction: Axis.horizontal,
                                      height: 300,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("Testimonials".tr,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: myColors.darkgreen)),
                        ),
                        SizedBox(
                          width: widget.width * 0.62,
                          child: Divider(
                            height: 0,
                            thickness: 2,
                            color: myColors.darkgreen,
                          ),
                        ),
                        SizedBox(
                          height: 500,
                          width: widget.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: widget.width * 0.3,
                                child: ScrolllVerticle(
                                  widget: (context, i) {
                                    if (i % 2 == 0) {
                                      return SizedBox(
                                        width: widget.width * 0.3,
                                        height: 132,
                                        child: Row(children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.dialog(Dialog(
                                                child: SizedBox(
                                                  width: 400,
                                                  height: 600,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Text(state.language ==
                                                                  const Locale(
                                                                      'en',
                                                                      'EN')
                                                              ? engTestimony[i %
                                                                      engTestimony
                                                                          .length]
                                                                  .name
                                                              : nepTestimony[i %
                                                                      nepTestimony
                                                                          .length]
                                                                  .name),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                          Text(state.language ==
                                                                  const Locale(
                                                                      'en',
                                                                      'EN')
                                                              ? engTestimony[i %
                                                                      engTestimony
                                                                          .length]
                                                                  .data
                                                              : nepTestimony[i %
                                                                      nepTestimony
                                                                          .length]
                                                                  .data),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ));
                                            },
                                            child: Container(
                                                width: widget.width * 0.3 - 64,
                                                height: 132,
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: myColors.white,
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color:
                                                          myColors.darkgreen),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: ListTile(
                                                  leading: Container(
                                                    width: 64,
                                                    height: 64,
                                                    decoration:
                                                         BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                           image: DecorationImage(image: AssetImage(testimonialImage[i%testimonialImage.length]))),
                                                  ),
                                                  title: Text(state.language ==
                                                          const Locale(
                                                              'en', 'EN')
                                                      ? engTestimony[i %
                                                              engTestimony
                                                                  .length]
                                                          .name
                                                      : nepTestimony[i %
                                                              nepTestimony
                                                                  .length]
                                                          .name),
                                                  subtitle: SizedBox(
                                                    width: widget.width * 0.3 -
                                                        180,
                                                    height: 132,
                                                    child: Text(
                                                      state.language ==
                                                              const Locale(
                                                                  'en', 'EN')
                                                          ? engTestimony[i %
                                                                  engTestimony
                                                                      .length]
                                                              .data
                                                          : nepTestimony[i %
                                                                  nepTestimony
                                                                      .length]
                                                              .data,
                                                      maxLines: 4,
                                                    ),
                                                  ),
                                                )),
                                          ),
                                          Container(
                                            width: 64,
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
                                width: 2,
                                height: 500,
                                color: myColors.darkgreen,
                              ),
                              SizedBox(
                                width: widget.width * 0.3,
                                child: ScrolllVerticle(
                                  widget: (context, i) {
                                    if (i % 2 != 0) {
                                      return SizedBox(
                                        width: widget.width * 0.3,
                                        height: 132,
                                        child: Row(children: [
                                          Container(
                                            width: 64,
                                            height: 1,
                                            color: myColors.darkgreen,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.dialog(Dialog(
                                                child: SizedBox(
                                                  width: 400,
                                                  height: 600,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Text(state.language ==
                                                                  const Locale(
                                                                      'en',
                                                                      'EN')
                                                              ? engTestimony[i %
                                                                      engTestimony
                                                                          .length]
                                                                  .name
                                                              : nepTestimony[i %
                                                                      nepTestimony
                                                                          .length]
                                                                  .name),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                          Text(state.language ==
                                                                  const Locale(
                                                                      'en',
                                                                      'EN')
                                                              ? engTestimony[i %
                                                                      engTestimony
                                                                          .length]
                                                                  .data
                                                              : nepTestimony[i %
                                                                      nepTestimony
                                                                          .length]
                                                                  .data),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ));
                                            },
                                            child: Container(
                                                width: widget.width * 0.3 - 64,
                                                height: 132,
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: myColors.white,
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color:
                                                          myColors.darkgreen),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: ListTile(
                                                  leading: Container(
                                                    width: 64,
                                                    height: 64,
                                                    decoration:
                                                         BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                           image: DecorationImage(image: AssetImage(testimonialImage[i%testimonialImage.length]))),
                                                  ),
                                                  title: Text(state.language ==
                                                          const Locale(
                                                              'en', 'EN')
                                                      ? engTestimony[i %
                                                              engTestimony
                                                                  .length]
                                                          .name
                                                      : nepTestimony[i %
                                                              nepTestimony
                                                                  .length]
                                                          .name),
                                                  subtitle: SizedBox(
                                                    width: widget.width * 0.3 -
                                                        180,
                                                    height: 132,
                                                    child: Text(
                                                      state.language ==
                                                              const Locale(
                                                                  'en', 'EN')
                                                          ? engTestimony[i %
                                                                  engTestimony
                                                                      .length]
                                                              .data
                                                          : nepTestimony[i %
                                                                  nepTestimony
                                                                      .length]
                                                              .data,
                                                      maxLines: 4,
                                                    ),
                                                  ),
                                                )),
                                          )
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
                          width: widget.width * 0.62,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64.0),
                          child: Image.asset("assets/team.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: widget.width * 0.5 - 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Text("GET THE APP",
                                          style: TextStyle(
                                              fontSize: 42,
                                              fontWeight: FontWeight.w600,
                                              color: myColors.darkgreen)),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Text(
                                          "Experience hassel free recruitment with santi overseas!\nDownload the app today and take the first step towards dream jobs abroad",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                              color: myColors.darkgreen)),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        launchUrl(Uri.parse(
                                            "https://drive.google.com/uc?export=download&id=1BnVPwYw3vsFzXi3-7O7aPmgtJ-gS6JWS"));
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 32.0),
                                        child: Text("Download",
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.w600,
                                                color: myColors.darkgreen)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: widget.width * 0.5,
                                child: Image.asset(
                                  "assets/ss.png",
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: widget.width,
                          height: 300,
                          color: myColors.darkgreen,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: widget.width * 0.42,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text("Find Us On Social Media",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600,
                                                color: myColors.white)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: SizedBox(
                                          width: widget.width * 0.3,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  launchUrl(Uri.parse(
                                                      "https://www.facebook.com/profile.php?id=100090616503497"));
                                                },
                                                child: Chip(
                                                    backgroundColor:
                                                        const Color(0xff4267B2),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4)),
                                                    label: const Text(
                                                      "Facebook",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  launchUrl(Uri.parse(
                                                      "https://twitter.com/OverseasSanti"));
                                                },
                                                child: Chip(
                                                    backgroundColor:
                                                        const Color(0xff00acee),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4)),
                                                    label: const Text(
                                                      "Twitter",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  launchUrl(Uri.parse(
                                                      "https://www.instagram.com/santi_overseas/"));
                                                },
                                                child: Chip(
                                                    backgroundColor:
                                                        const Color(0xffd62976),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4)),
                                                    label: const Text(
                                                      "Instagram",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  launchUrl(Uri.parse(
                                                      "https://www.youtube.com/channel/UCal825XqmaEUsDjdRKuFoHQ"));
                                                },
                                                child: Chip(
                                                    backgroundColor:
                                                        const Color(0xffFF0000),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4)),
                                                    label: const Text(
                                                      "YouTube",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  launchUrl(Uri.parse(
                                                      "https://www.tiktok.com/@santi_overseas?_t=8dVtAYtgQNe&_r=1"));
                                                },
                                                child: Chip(
                                                    backgroundColor:
                                                        const Color(0xffff0050),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4)),
                                                    label: const Text(
                                                      "TikTok",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                            "Subscribe to our news letter",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: myColors.white)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: widget.width * 0.3,
                                              height: 54,
                                              child: TextField(
                                                style: TextStyle(
                                                    color: myColors.darkgreen),
                                                cursorColor: myColors.darkgreen,
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: myColors
                                                                  .lightgreen)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: myColors
                                                                  .darkgreen)),
                                                  labelText: "Email",
                                                  labelStyle: TextStyle(
                                                      color:
                                                          myColors.darkgreen),
                                                  floatingLabelStyle: TextStyle(
                                                    color: myColors.blue,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    backgroundColor:
                                                        myColors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 72,
                                              height: 54,
                                              decoration: BoxDecoration(
                                                  color: myColors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: const Center(
                                                child: Text(
                                                  "Subscribe",
                                                  style: TextStyle(
                                                      color: Colors.white),
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
                                  width: 2,
                                  height: 200,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: widget.width * 0.24,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                         onTap: () {
                    launchUrl(Uri.parse(
                        "https://www.google.com/maps/place/Santi+Overseas+Pvt.+Ltd./@27.7351503,85.3353543,17z/data=!3m1!4b1!4m6!3m5!1s0x39eb192cdd2191ab:0xf59810fce01ff89e!8m2!3d27.7351503!4d85.3379292!16s%2Fg%2F11rq985k99?entry=ttu"));
                  },
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                              "Contact Us: Santi OverSeas",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: myColors.white)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text("Telephone: 01-5910769",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: myColors.white)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                            "Email: santioverseas@gmail.com",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: myColors.white)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                            "Location: Chundevi Marg, Maharajgunj, Kathmandu 44600",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: myColors.white)),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                   onTap: () {
                    launchUrl(Uri.parse(
                        "https://www.google.com/maps/place/Santi+Overseas+Pvt.+Ltd./@27.7351503,85.3353543,17z/data=!3m1!4b1!4m6!3m5!1s0x39eb192cdd2191ab:0xf59810fce01ff89e!8m2!3d27.7351503!4d85.3379292!16s%2Fg%2F11rq985k99?entry=ttu"));
                  },
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
                        ),
                        GestureDetector(
                          onTap: () {
                            Uri url = Uri.parse(
                                "https://freeticketfreevisa.com/privacypolicy");
                            launchUrl(url);
                          },
                          child: Container(
                            width: widget.width,
                            height: 32,
                            color: myColors.blue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                    "Copyright © ${DateTime.now().year} Santi OverSeas Pvt.Ltd. All rights reserved"),
                                const Text("Privacy Policy")
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )));
        });
  }
}

class GalleryImage extends StatefulWidget {
  final String path;
  const GalleryImage({
    super.key,
    required this.path,
  });

  @override
  State<GalleryImage> createState() => _GalleryImageState();
}

class _GalleryImageState extends State<GalleryImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.dialog(Center(
          child: Dialog(
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 500,
              width: 800,
              child: Image.network(
                "https://freeticketfreevisa.com/${widget.path}",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: const EdgeInsets.all(8),
          height: 132,
          width: 132,
          child: Image.network(
            "https://freeticketfreevisa.com/${widget.path}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

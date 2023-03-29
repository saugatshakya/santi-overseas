import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/data/functions/jobs.dart';
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
import 'dart:html' as html;

class MainPage extends StatelessWidget {
  MainPage({
    super.key,
    required this.height,
    required this.width,
    required this.countryCheckBox,
    required this.companies,
    required this.questions,
    required this.answers,
    required this.searches,
  });
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final double height;
  final double width;
  final List countryCheckBox;
  final List companies;
  final List questions;
  final List answers;
  final List searches;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
        init: appStateController,
        builder: (state) {
          return SafeArea(
              child: Container(
                  height: height - 48,
                  width: width,
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
                                "Discover the Perfect international job for you",
                                style: GoogleFonts.ptSerif(
                                    color: myColors.white,
                                    fontSize: 48,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "To get your dream job register & fill out your profile first",
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
                                    suggestions: const [
                                      "aag",
                                      "bage",
                                      "chaeh",
                                      "dawt"
                                    ],
                                    label: "Jobs, Title, Keywords or Company",
                                    icon: Icons.search,
                                    width: 400,
                                    focusNode: state.seachCountryFocus,
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
                                    width: 250,
                                    focusNode: state.seachJobFocus,
                                  ),
                                  const SearchButton()
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
                              if (countryCheckBox.isNotEmpty)
                                ScrollWidget(
                                    reverse: false,
                                    height: 100,
                                    stop: false,
                                    direction: Axis.horizontal,
                                    widget: (context, i) => GestureDetector(
                                          onTap: () {},
                                          child: CountrySelector(
                                            country: countryCheckBox[
                                                    i % countryCheckBox.length]
                                                ["country"],
                                            code: countryCheckBox[i %
                                                countryCheckBox.length]["code"],
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
                                        imageLink:
                                            companies[i % companies.length]),
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
                        Row(
                          children: [
                            SizedBox(
                              width: width * 0.5 - 16,
                              height: 248,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 32.0),
                                    child: Text("ZERO COST",
                                        style: TextStyle(
                                            fontSize: 64,
                                            fontWeight: FontWeight.w600,
                                            color: myColors.blue)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 32.0),
                                    child: Text("RECRUITMENT",
                                        style: TextStyle(
                                            fontSize: 52,
                                            fontWeight: FontWeight.w500,
                                            color: myColors.blue)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              color: myColors.darkgreen,
                              width: width * 0.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "How Can We Help You?",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: _name,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
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
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
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
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
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
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
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
                                  SizedBox(
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
                                          Get.dialog(Dialog(
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
                                          Get.dialog(Dialog(
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
                        SizedBox(
                          height: 16,
                        ),
                        const MainTable(),
                        Divider(
                          height: 0,
                          thickness: 2,
                          color: myColors.darkgreen,
                        ),
                        if (searches.isNotEmpty)
                          const SizedBox(
                            height: 16,
                          ),
                        if (searches.isNotEmpty)
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
                        if (searches.isNotEmpty)
                          const SizedBox(
                            height: 16,
                          ),
                        if (searches.isNotEmpty)
                          ScrollWidget(
                              reverse: false,
                              widget: (context, i) => Searches(
                                  search: searches[i % searches.length]),
                              direction: Axis.horizontal,
                              height: 64),
                        if (searches.isNotEmpty)
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
                                width: width * 0.42,
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
                                                padding:
                                                    const EdgeInsets.all(6.0),
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
                                                          color: myColors
                                                              .darkgreen,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 68,
                                                      child: Text(
                                                        "→ ${answers[i % answers.length]}",
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
                                width: width * 0.42,
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
                                      widget: (context, i) => const News(),
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
                          child: Text("TESTIMONIALS",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: myColors.darkgreen)),
                        ),
                        SizedBox(
                          width: width * 0.62,
                          child: Divider(
                            height: 0,
                            thickness: 2,
                            color: myColors.darkgreen,
                          ),
                        ),
                        SizedBox(
                          height: 500,
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width * 0.3,
                                child: ScrolllVerticle(
                                  widget: (context, i) {
                                    if (i % 2 == 0) {
                                      return SizedBox(
                                        width: width * 0.3,
                                        height: 132,
                                        child: Row(children: [
                                          Container(
                                              width: width * 0.3 - 64,
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
                                                  width: 64,
                                                  height: 64,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.yellow),
                                                ),
                                                title: const Text("Name "),
                                                subtitle: SizedBox(
                                                  width: width * 0.3 - 180,
                                                  height: 132,
                                                  child: const Text(
                                                      "It is the visa system sanctioned by the employer bearing all the processing cost of the employees."),
                                                ),
                                              )),
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
                                width: width * 0.3,
                                child: ScrolllVerticle(
                                  widget: (context, i) {
                                    if (i % 2 != 0) {
                                      return SizedBox(
                                        width: width * 0.3,
                                        height: 132,
                                        child: Row(children: [
                                          Container(
                                            width: 64,
                                            height: 1,
                                            color: myColors.darkgreen,
                                          ),
                                          Container(
                                              width: width * 0.3 - 64,
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
                                                  width: 64,
                                                  height: 64,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.yellow),
                                                ),
                                                title: const Text("Name "),
                                                subtitle: SizedBox(
                                                  width: width * 0.3 - 180,
                                                  height: 132,
                                                  child: const Text(
                                                      "It is the visa system sanctioned by the employer bearing all the processing cost of the employees."),
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
                          width: width * 0.62,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: width * 0.5 - 16,
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
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.0),
                                      child: Text("COMING SOON",
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w600,
                                              color: myColors.darkgreen)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: width * 0.5,
                                child: Image.asset(
                                  "assets/ss.png",
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: width,
                          height: 300,
                          color: myColors.darkgreen,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: width * 0.42,
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
                                          width: width * 0.3,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Chip(
                                                  backgroundColor:
                                                      Color(0xff4267B2),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                  label: Text(
                                                    "Facebook",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                              Chip(
                                                  backgroundColor:
                                                      Color(0xff00acee),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                  label: Text(
                                                    "Twitter",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                              Chip(
                                                  backgroundColor:
                                                      Color(0xffd62976),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                  label: Text(
                                                    "Instagram",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                              Chip(
                                                  backgroundColor:
                                                      Color(0xffFF0000),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                  label: Text(
                                                    "YouTube",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                              Chip(
                                                  backgroundColor:
                                                      Color(0xffff0050),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                  label: Text(
                                                    "TikTok",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ))
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
                                              width: width * 0.3,
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
                                  width: width * 0.24,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                            "Contact Us: Santi OverSeas",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: myColors.white)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text("Telephone: 9810479710",
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
                                        child: Text("Location: xyz",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: myColors.white)),
                                      ),
                                    ],
                                  ),
                                ),
                                Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: Image.asset("assets/map.png")))
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            html.window.open(
                                'https://freeticketfreevisa.com/privacypolicy',
                                "_self");
                          },
                          child: Container(
                            width: width,
                            height: 32,
                            color: myColors.blue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                    "Copyright © ${DateTime.now().year} Santi OverSeas Pvt.Ltd. All rights reserved"),
                                Text("Privacy Policy")
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
              height: 300,
              width: 300,
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/presentation/widgets/company_logo.dart';
import 'package:testapp/presentation/widgets/country_selector.dart';
import 'package:testapp/presentation/widgets/main_table.dart';
import 'package:testapp/presentation/widgets/news.dart';
import 'package:testapp/presentation/widgets/scroll_widget.dart';
import 'package:testapp/presentation/widgets/search.dart';
import 'package:testapp/presentation/widgets/searches.dart';
import 'package:testapp/presentation/widgets/searchlist.dart';
import 'package:testapp/static/colors.dart';
import 'dart:html' as html;

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.height,
    required this.width,
    required this.countryCheckBox,
    required this.companies,
    required this.questions,
    required this.answers,
  });

  final double height;
  final double width;
  final List<Map> countryCheckBox;
  final List companies;
  final List questions;
  final List answers;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
        init: appStateController,
        builder: (state) {
          return SafeArea(
              child: Container(
                  color: myColors.white.withOpacity(0.9),
                  height: height,
                  width: width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
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
                                style: GoogleFonts.shadowsIntoLight(
                                    color: myColors.white,
                                    fontSize: 48,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "To get your dream job register & fill out your profile first",
                                style: GoogleFonts.shadowsIntoLight(
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
                              ScrollWidget(
                                  reverse: false,
                                  height: 100,
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
                        const SizedBox(
                          height: 16,
                        ),
                        ScrollWidget(
                            reverse: true,
                            height: 100,
                            direction: Axis.horizontal,
                            widget: (context, i) => GestureDetector(
                                  onTap: () {},
                                  child: CompanyLogo(
                                      imageLink:
                                          companies[i % companies.length]),
                                )),
                        const SizedBox(
                          height: 32,
                        ),
                        Divider(
                          height: 0,
                          thickness: 2,
                          color: myColors.darkgreen,
                        ),
                        const MainTable(),
                        const SizedBox(
                          height: 16,
                        ),
                        Divider(
                          height: 0,
                          thickness: 2,
                          color: myColors.darkgreen,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
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
                        const SizedBox(
                          height: 16,
                        ),
                        ScrollWidget(
                            reverse: false,
                            widget: (context, i) =>
                                Searches(search: "Search $i"),
                            direction: Axis.horizontal,
                            height: 64),
                        const SizedBox(
                          height: 32,
                        ),
                        Divider(
                          height: 0,
                          thickness: 2,
                          color: myColors.darkgreen,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          height: 500,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: width * 0.42,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("FAQs",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: myColors.darkgreen)),
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
                                        height: 300),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      alignment: Alignment.center,
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 8, 16, 8),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: myColors.lightgreen,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Text(
                                          "View All",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: myColors.darkgreen,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: width * 0.42,
                                height: 464,
                                child: Column(
                                  children: [
                                    Text("News",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: myColors.darkgreen)),
                                    const SizedBox(
                                      height: 32,
                                    ),
                                    NewsScroll(
                                      widget: (context, i) => const News(),
                                      direction: Axis.horizontal,
                                      height: 300,
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 8, 16, 8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: myColors.lightgreen),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Text(
                                        "View All",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: myColors.darkgreen,
                                        ),
                                      ),
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
                            color: myColors.darkgreen,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        if (state.gallery.isNotEmpty)
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text("GALLERY",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: myColors.darkgreen)),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              ScrollWidget(
                                  reverse: false,
                                  widget: (context, i) => GalleryImage(path: state.gallery[i % state.gallery.length].imagePath!,),
                                  direction: Axis.horizontal,
                                  height: 132),
                            ],
                          ),
                        const SizedBox(
                          height: 64,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: width * 0.42,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text("GET THE APP",
                                          style: TextStyle(
                                              fontSize: 42,
                                              fontWeight: FontWeight.w600,
                                              color: myColors.darkgreen)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                          "Experience hassel free recruitment with santi overseas!\nDownload the app today and take the first step towards dream jobs abroad",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                              color: myColors.darkgreen)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text("COMING SOON",
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w600,
                                              color: myColors.darkgreen)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 2,
                                height: 200,
                                color: myColors.darkgreen,
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: SizedBox(
                                    width: width * 0.42,
                                    child: Image.asset(
                                      "assets/ss.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 32,
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
                                              child: Center(
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
                                  width: width * 0.42,
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
    super.key, required this.path,
  });

  @override
  State<GalleryImage> createState() => _GalleryImageState();
}

class _GalleryImageState extends State<GalleryImage> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector
    (onTap: (){
      Get.dialog(Center(child: Dialog(child: Container(
              margin: const EdgeInsets.all(8),
              height:300,
              width: 300,
              child: Image.network(
                "https://freeticketfreevisa.com/${widget.path}",
                fit: BoxFit.cover,
              ),
            ),),));
    },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        
        child: Container(
              margin: const EdgeInsets.all(8),
              height:132,
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

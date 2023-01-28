import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/presentation/widgets/country_selector.dart';
import 'package:testapp/presentation/widgets/my_appbar.dart';
import 'package:testapp/presentation/widgets/news.dart';
import 'package:testapp/presentation/widgets/searches.dart';
import 'package:testapp/presentation/widgets/searchlist.dart';
import 'package:testapp/presentation/widgets/main_table.dart';
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
    {"country": "Dubai", "code": FlagsCode.AE}
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<AppStateController>(
        init: appStateController,
        builder: (state) {
          return Scaffold(
            appBar: MyAppBar(width),
            body: SafeArea(
                child: Container(
                    color: Colors.white,
                    height: height,
                    width: width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 64,
                          ),
                          Text(
                            "Discover the Perfect international job for you",
                            style: GoogleFonts.shadowsIntoLight(
                                color: myColors.darkgreen,
                                fontSize: 48,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "To get your dream job register & fill out your profile first",
                            style: GoogleFonts.shadowsIntoLight(
                                color: myColors.darkgreen, fontSize: 28),
                          ),
                          const SizedBox(
                            height: 64,
                          ),
                          SizedBox(
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SearchableTextField(
                                  suggestions: ["a", "b", "c", "d"],
                                  label: "Jobs, Title, Keywords or Company",
                                  icon: Icons.search,
                                  width: 300,
                                ),
                                SearchableTextField(
                                  suggestions: [
                                    "Dharan",
                                    "Kathmandu",
                                    "Pokhara",
                                    "Ithari"
                                  ],
                                  label: "Area, City, Town, Country",
                                  icon: Icons.location_on,
                                  width: 250,
                                ),
                                // SearchableTextField(
                                //   suggestions: ["a", "b", "c", "d"],
                                //   label: "All Jobs Specialised In",
                                //   icon: Icons.person_search_sharp,
                                //   width: 230,
                                // ),
                                SearchableTextField(
                                  suggestions: [],
                                  label: "Search",
                                  width: 120,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Divider(
                            height: 0,
                            thickness: 2,
                            color: myColors.darkgreen,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < countryCheckBox.length; i++)
                                GestureDetector(
                                  onTap: () {},
                                  child: CountrySelector(
                                    country: countryCheckBox[i]["country"],
                                    code: countryCheckBox[i]["code"],
                                  ),
                                )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const MainTable(),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.fromLTRB(32, 8, 8, 8),
                            child: Text("Popular Searches",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: myColors.darkgreen)),
                          ),
                          Wrap(
                            children: [
                              for (int i = 0; i < 14; i++)
                                const Searches(search: "Security Guard")
                            ],
                          ),
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
                          Table(
                            border: TableBorder.all(
                                color: myColors.darkgreen, width: 2),
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 8, 8, 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "FAQs",
                                        style: TextStyle(
                                          fontSize: 28,
                                          color: myColors.darkgreen,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      for (int i = 0; i < 2; i++)
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${i + 1}  Question",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: myColors.darkgreen,
                                                ),
                                              ),
                                              Text(
                                                "→ Answer",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: myColors.darkgreen,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                Column(
                                  children: [
                                    Text(
                                      "News",
                                      style: TextStyle(
                                        fontSize: 28,
                                        color: myColors.darkgreen,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [News(), News(), News()],
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
                                )
                              ])
                            ],
                          )
                        ],
                      ),
                    ))),
          );
        });
  }
}

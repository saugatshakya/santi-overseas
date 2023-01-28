import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/presentation/widgets/country_checkbox.dart';
import 'package:testapp/presentation/widgets/my_appbar.dart';
import 'package:testapp/presentation/widgets/searchlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map> countryCheckBox = [
    {"country": "Qatar", "value": false},
    {"country": "Malaysia", "value": false},
    {"country": "Saudi", "value": false},
    {"country": "kuwait", "value": false},
    {"country": "Dubai", "value": false}
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Discover the Perfect international job for you",
                          style: GoogleFonts.shadowsIntoLight(
                              fontSize: 32, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "To get your dream job register & fill out your profile first",
                          style: GoogleFonts.shadowsIntoLight(fontSize: 24),
                        ),
                        SizedBox(
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                suggestions: const [],
                                label: "Search",
                                width: 120,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 0,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < countryCheckBox.length; i++)
                              GestureDetector(
                                onTap: () {
                                  countryCheckBox[i]["value"] =
                                      !countryCheckBox[i]["value"];
                                  setState(() {});
                                },
                                child: CountryCheckbox(
                                    country: countryCheckBox[i]["country"],
                                    value: countryCheckBox[i]["value"]),
                              )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          height: 0,
                          thickness: 2,
                        ),
                      ],
                    ))),
          );
        });
  }
}

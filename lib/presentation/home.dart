import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/presentation/widgets/search.dart';
import 'package:testapp/presentation/widgets/searchlist.dart';
import 'package:testapp/static/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Material(
      color: Colors.white,
      child: GetBuilder<AppStateController>(
          init: appStateController,
          builder: (state) {
            return AnimatedBackground(
              vsync: this,
              behaviour: RandomParticleBehaviour(
                  options: ParticleOptions(
                      baseColor: myColors.darkgreen,
                      maxOpacity: 0.5,
                      minOpacity: 0.1,
                      opacityChangeRate: 0.2,
                      spawnOpacity: 0.1,
                      spawnMaxRadius: 5,
                      spawnMaxSpeed: 100,
                      spawnMinSpeed: 50,
                      particleCount: 200)),
              child: SafeArea(
                child: SizedBox(
                  width: width,
                  height: height,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 232,
                          child: Container(
                            width: width,
                            height: 216,
                            color: Colors.white70,
                          )),
                      Positioned(
                          top: 232,
                          child: Container(
                            width: width,
                            height: 216,
                            color: Colors.white30,
                          )),
                      Positioned(
                        right: width > 800 ? width * 0.05 : width * 0.1,
                        top: 130,
                        child: SizedBox(
                            width: width > 800 ? width * 0.3 : width * 0.8,
                            child: Image.asset("assets/image 138@3x.png")),
                      ),
                      Positioned(
                          top: 352,
                          left: 64,
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            child: const SizedBox(
                              width: 924,
                              height: 82,
                            ),
                          )),
                      Positioned(
                          top: 232,
                          left: 64,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Discover the Perfect international job for you",
                                style: GoogleFonts.actor(
                                    color: myColors.darkgreen,
                                    fontSize: 48,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "To get your dream job register & fill out your profile first",
                                style: GoogleFonts.actor(
                                    color: myColors.darkgreen, fontSize: 28),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 8),
                                child: Row(
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
                                      width: 400,
                                      focusNode: state.seachJobFocus,
                                    ),
                                    SearchButton()
                                  ],
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

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
                          top: 284,
                          child: Container(
                            width: width,
                            height: 216,
                            color: Colors.white70,
                          )),
                      Positioned(
                          top: 284,
                          child: Container(
                            width: width,
                            height: 216,
                            color: Colors.white30,
                          )),
                      Positioned(
                        right: width * 0.05,
                        bottom: 0,
                        child: SizedBox(
                            width: width > 800 ? width * 0.4 : width * 0.6,
                            child: Image.asset("assets/worker.png")),
                      ),
                      Positioned(
                          top: 300,
                          left: 32,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: width * 0.86,
                                child: Text(
                                  "Discover the Perfect international job for you",
                                  style: GoogleFonts.actor(
                                      color: myColors.darkgreen,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "To get your dream job register & fill out your profile first",
                                style: GoogleFonts.actor(
                                    color: myColors.darkgreen, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              SizedBox(
                                width: width * 0.6,
                                child: Wrap(
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
                                    const SearchButton()
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

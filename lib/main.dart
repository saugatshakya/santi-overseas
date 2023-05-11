import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/data/repo/user_info.dart';
import 'package:testapp/presentation/free_ticket_free_visa.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:testapp/presentation/widgets/show_auth.dart';
import 'package:testapp/static/colors.dart';
import 'mobile_presentation/main_page.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  if (kIsWeb) {
    // initialiaze the facebook javascript SDK
    await FacebookAuth.i.webAndDesktopInitialize(
      appId: "604017458447537",
      cookie: true,
      xfbml: true,
      version: "v16.0",
    );
    await Future.delayed(const Duration(milliseconds: 500));
    Get.dialog(Dialog(
      child: Stack(children: [
        Image.asset("assets/ddbox.jpg"),
        Positioned(
            top: 0,
            right: 16,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                width: 32,
                height: 32,
                child: const Center(child: Icon(Icons.close)),
              ),
            ))
      ]),
    ));
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Santi OverSeas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: GoogleFonts.ptSans().fontFamily,
      ),
      home: Get.width < 1000 ? const MiniWidget() : const MainWidget(),
    );
  }
}

class MiniWidget extends StatelessWidget {
  const MiniWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          backgroundColor: myColors.lightgreen,
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                ListTile(
                  onTap: () {
                    appStateController.changePage(0);
                    Navigator.pop(context);
                  },
                  dense: true,
                  title: Text(
                    "Home",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  subtitle: Divider(
                    color: Colors.white,
                    thickness: 1,
                    endIndent: 80,
                  ),
                ),
                ListTile(
                  onTap: () {
                    appStateController.changePage(1);
                    Navigator.pop(context);
                  },
                  dense: true,
                  title: Text(
                    "Jobs",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  subtitle: Divider(
                    color: Colors.white,
                    thickness: 1,
                    endIndent: 80,
                  ),
                ),
                ListTile(
                  onTap: () {
                    appStateController.changePage(2);
                    Navigator.pop(context);
                  },
                  dense: true,
                  title: Text(
                    "Companies",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  subtitle: Divider(
                    color: Colors.white,
                    thickness: 1,
                    endIndent: 64,
                  ),
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    appStateController.changePage(3);
                    Navigator.pop(context);
                  },
                  title: Text(
                    "About us",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  subtitle: Divider(
                    color: Colors.white,
                    endIndent: 48,
                    thickness: 1,
                  ),
                ),
                ListTile(
                  onTap: showAuthDialog,
                  dense: true,
                  title: Text(
                    "Login/SignUp",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  subtitle: Divider(
                    color: Colors.white,
                    endIndent: 32,
                    thickness: 1,
                  ),
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    Uri url = Uri.parse("https://freeticketfreevisa.com/admin");
                    launchUrl(url);
                  },
                  title: Text(
                    "For Employees",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  subtitle: Divider(
                    color: Colors.white,
                    endIndent: 16,
                    thickness: 1,
                  ),
                ),
                Spacer(),
                Text(
                  "Phone Number: 9810479710",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Text(
                  "Location: basundhara chawki, kathmandu",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Text(
                  "Pan Number: 113513513513",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          )),
      appBar: AppBar(
        title: const Text(
          "SANTI OVERSEAS",
          style: TextStyle(
              letterSpacing: 4,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: myColors.darkgreen,
      ),
      body: MobileView(),
    );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 48,
            color: myColors.darkgreen,
            child: Row(
              children: [
                const SizedBox(
                  width: 32,
                ),
                const Text(
                  "Pan Number: 174518264812658",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 32,
                ),
                const Icon(
                  Icons.phone_outlined,
                  color: Colors.white,
                ),
                const Text(
                  "9800000000",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 32,
                ),
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
                const Text(
                  "Basundara Chawki, Kathmandu",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 32,
                ),
                const Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
                Text(
                  DateFormat("E MMM d yyyy").format(DateTime.now()),
                  style: const TextStyle(color: Colors.white),
                ),
                const Spacer(),
                SizedBox(
                  width: 92,
                  height: 48,
                  child: GetBuilder<AppStateController>(
                      init: appStateController,
                      builder: (state) {
                        return PopupMenuButton(
                          onSelected: (val) {
                            appStateController.changeLanguageI(val);
                          },
                          offset: const Offset(0, 48),
                          itemBuilder: (_) => [
                            const PopupMenuItem(
                                value: Locale("Nepali", "NE"),
                                child: Text("Nepali")),
                            const PopupMenuItem(
                                value: Locale("English", "EN"),
                                child: Text("English"))
                          ],
                          child: Container(
                            width: 92,
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              Text(
                                state.language.languageCode,
                                style: TextStyle(
                                    color: myColors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: myColors.white,
                              )
                            ]),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height - 48, child: Home())
        ]),
      ),
    );
  }
}

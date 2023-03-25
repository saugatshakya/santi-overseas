import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/presentation/free_ticket_free_visa.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:testapp/static/colors.dart';

void main() async {
  if (kIsWeb) {
    // initialiaze the facebook javascript SDK
    await FacebookAuth.i.webAndDesktopInitialize(
      appId: "9460389773974765",
      cookie: true,
      xfbml: true,
      version: "v14.0",
    );
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
      home: const MainWidget(),
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

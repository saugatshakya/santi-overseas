import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/presentation/free_ticket_free_visa.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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
      home: const Home(),
    );
  }
}

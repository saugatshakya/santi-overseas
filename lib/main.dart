import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/temp_home_page.dart';
import 'package:testapp/temp_home_phone.dart';
import 'package:universal_html/html.dart' as html;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String phoneType = "phone";

  final String desktopType = "desktop";

  String getSmartPhoneOrTablet() {
    final userAgent = html.window.navigator.userAgent.toString().toLowerCase();
    // smartphone
    if (userAgent.contains("iphone") || userAgent.contains("android")) {
      return phoneType;
    }
    // tablet
    else {
      return desktopType;
    }
  }

  @override
  void initState() {
    print(getSmartPhoneOrTablet());
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: GoogleFonts.ptSans().fontFamily,
          useMaterial3: true),
      home: getSmartPhoneOrTablet() == phoneType
          ? const TempHomePhone()
          : const TempHomePage(),
    );
  }
}

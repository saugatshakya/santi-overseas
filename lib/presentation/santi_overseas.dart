import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/presentation/home.dart';
import 'package:testapp/presentation/jobs.dart';
import 'package:testapp/presentation/widgets/my_appbar.dart';
import 'package:testapp/static/colors.dart';

class SantiOverseas extends StatefulWidget {
  SantiOverseas({super.key});

  @override
  State<SantiOverseas> createState() => _SantiOverseasState();
}

class _SantiOverseasState extends State<SantiOverseas>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<AppStateController>(
        init: appStateController,
        builder: (state) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  SizedBox(
                    width: width,
                    height: height,
                    child: PageView(
                      controller: state.currentPage,
                      pageSnapping: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const Home(),
                        const Jobs(),
                        Container(
                          color: Colors.blue,
                        ),
                        Container(
                          color: Colors.yellow,
                        ),
                        Container(
                          color: Colors.green,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 100, child: MyAppBar(width)),
                ],
              ));
        });
  }
}

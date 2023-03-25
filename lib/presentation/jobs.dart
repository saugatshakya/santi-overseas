import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/data/functions/utils.dart';
import 'package:testapp/presentation/widgets/job_listing.dart';
import 'package:testapp/presentation/widgets/pagination.dart';
import 'package:testapp/static/colors.dart';

class Jobs extends StatefulWidget {
  const Jobs({super.key});

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.white,
      child: GetBuilder<AppStateController>(
          init: appStateController,
          builder: (state) {
            return Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 164,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/17278525.png"),
                          opacity: 0.3,
                          fit: BoxFit.cover),
                      gradient: LinearGradient(
                          colors: [myColors.darkgreen, myColors.lightgreen],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                  child: Text(
                    "Jobs",
                    style: TextStyle(fontSize: 32, color: myColors.white),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "All jobs",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: myColors.darkgreen),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Page ${state.pagination} of ${state.jobs.length} Jobs",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: myColors.darkgreen),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: Wrap(
                            children: [
                              for (int i = ((state.pagination - 1) *
                                      state.perPageItem);
                                  i <
                                      (state.pagination * state.perPageItem >
                                              state.jobs.length
                                          ? state.jobs.length
                                          : state.pagination *
                                              state.perPageItem);
                                  i++)
                                JobListing(job: state.jobs[i]),
                              // const Spacer(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        NumberPagination(
                          onPageChanged: (int pageNumber) {
                            //do somthing for selected page
                            setState(() {
                              state.changePagination(pageNumber);
                            });
                          },
                          pageTotal:
                              (state.jobs.length / state.perPageItem).ceil(),
                          pageInit: state.pagination,
                          threshold: 6,
                          iconNext: Material(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            color: Colors.grey[200],
                            child: const SizedBox(
                              width: 32,
                              height: 32,
                              child: Center(
                                  child: Icon(Icons.keyboard_arrow_right)),
                            ),
                          ),
                          iconPrevious: Material(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            color: Colors.grey[200],
                            child: const SizedBox(
                              width: 32,
                              height: 32,
                              child: Center(
                                  child: Icon(Icons.keyboard_arrow_left)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

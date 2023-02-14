import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/app_state_controller.dart';
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
            return Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width,
                    height: 100,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
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
                            "Page 1 of ${state.itemCount} Jobs",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: myColors.darkgreen),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: height * 0.76,
                        width: width * 0.7,
                        child: SingleChildScrollView(
                            child: Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            for (int i = ((state.pagination - 1) *
                                        state.perPageItem) +
                                    1;
                                i < state.pagination * state.perPageItem + 1;
                                i++)
                              JobListing(i: i),
                            Padding(
                              padding: const EdgeInsets.only(top: 32.0),
                              child: SizedBox(
                                width: width * 0.7,
                                child: Center(
                                  child: SizedBox(
                                    width: 400,
                                    child: NumberPagination(
                                      onPageChanged: (int pageNumber) {
                                        //do somthing for selected page
                                        setState(() {
                                          state.changePagination(pageNumber);
                                        });
                                      },
                                      pageTotal:
                                          (state.itemCount / state.perPageItem)
                                              .ceil(),
                                      pageInit: state.pagination,
                                      threshold: 6,
                                      iconNext: Material(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        color: Colors.grey[200],
                                        child: const SizedBox(
                                          width: 32,
                                          height: 32,
                                          child: Center(
                                              child: Icon(
                                                  Icons.keyboard_arrow_right)),
                                        ),
                                      ),
                                      iconPrevious: Material(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        color: Colors.grey[200],
                                        child: const SizedBox(
                                          width: 32,
                                          height: 32,
                                          child: Center(
                                              child: Icon(
                                                  Icons.keyboard_arrow_left)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                      ),
                      Column()
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}

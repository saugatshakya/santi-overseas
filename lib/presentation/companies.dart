import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/data/functions/utils.dart';
import 'package:testapp/presentation/widgets/company_logo.dart';
import 'package:testapp/presentation/widgets/job_listing.dart';
import 'package:testapp/presentation/widgets/pagination.dart';
import 'package:testapp/static/colors.dart';

class Companies extends StatefulWidget {
  const Companies({super.key});

  @override
  State<Companies> createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  List companies = [
    "assets/company.jpg",
    "assets/company_1.jpg",
    "assets/company_2.jpg",
    "assets/company_3.jpg",
    "assets/company_4.jpg",
    "assets/company_5.jpg"
  ];
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
                    height: getSmartPhoneOrTablet() == phoneType && width < 500
                        ? 264
                        : width < 1275
                            ? 200
                            : 100,
                  ),
                  Text(
                    "All companies",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: myColors.darkgreen),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Page ${state.paginationC} of ${companies.length} Companies",
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
                      // alignment: WrapAlignment.spaceEvenly,
                      // runAlignment: WrapAlignment.spaceEvenly,
                      // crossAxisAlignment: WrapCrossAlignment.center,
                      // spacing: 12,
                      // runSpacing: 12,
                      children: [
                        for (int i =
                                ((state.paginationC - 1) * state.perPageItemC);
                            i <
                                (state.paginationC * state.perPageItemC <
                                        companies.length
                                    ? state.paginationC * state.perPageItemC
                                    : companies.length);
                            i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: 164,
                                height: 164,
                                child: CompanyLogo(imageLink: companies[i])),
                          ),
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
                        state.changeCompanyPagination(pageNumber);
                      });
                    },
                    pageTotal: (companies.length / state.perPageItemC).ceil(),
                    pageInit: state.paginationC,
                    threshold: 6,
                    iconNext: Material(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      color: Colors.grey[200],
                      child: const SizedBox(
                        width: 32,
                        height: 32,
                        child: Center(child: Icon(Icons.keyboard_arrow_right)),
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
                        child: Center(child: Icon(Icons.keyboard_arrow_left)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            );
          }),
    );
  }
}

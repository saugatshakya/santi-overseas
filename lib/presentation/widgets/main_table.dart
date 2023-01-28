import 'package:flutter/material.dart';
import 'package:testapp/presentation/widgets/company_logo.dart';
import 'package:testapp/presentation/widgets/job_listing.dart';
import 'package:testapp/static/colors.dart';

class MainTable extends StatelessWidget {
  const MainTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: myColors.darkgreen, width: 2),
      children: [
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 8, 8),
            child: Text(
              "New Jobs",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: myColors.darkgreen),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 8, 8),
            child: Text(
              "Top Employers",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: myColors.darkgreen),
            ),
          )
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
            child: Column(
              children: [
                for (int i = 0; i < 2; i++) JobListing(i: i),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: myColors.lightgreen),
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      "View All Job Listings",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: myColors.darkgreen),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 8, 8),
            child: Wrap(
              runSpacing: 16,
              alignment: WrapAlignment.center,
              spacing: 48,
              children: [
                for (int i = 0; i < 6; i++)
                  const CompanyLogo(
                      imageLink:
                          "https://upload.wikimedia.org/wikipedia/commons/e/e8/Tesla_logo.png"),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: myColors.lightgreen),
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    "View All Companies",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: myColors.darkgreen),
                  ),
                )
              ],
            ),
          )
        ])
      ],
    );
  }
}

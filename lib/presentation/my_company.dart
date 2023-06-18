import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:testapp/data/functions/jobs.dart';
import 'package:testapp/data/models/company.dart';
import 'package:testapp/data/models/country.dart';
import 'package:testapp/presentation/widgets/country_selector.dart';
import 'package:testapp/static/colors.dart';
import 'package:get/get.dart';

class MyCompany extends StatefulWidget {
  const MyCompany({super.key, required this.company, required this.employerId});
  final CompanyModel? company;
  final String employerId;
  @override
  State<MyCompany> createState() => _MyCompanyState();
}

class _MyCompanyState extends State<MyCompany> {
  List<dynamic> countries = [];
  bool addingCompany = false;
  bool addingCountry = false;
  bool addingJob = false;

  String alpha2Code = "";
  String countryName = "";

  String companyName = "";
  String phone = "";
  String address = "";
  String logoLink = "";
  String email = "";
  CompanyModel? company;

  String title = "";
  String category = "";
  String description = "";
  String requirement = "";
  String minQualification = "";
  String requiredNum = "";
  String hoursPDay = "";
  String hoursPWeek = "";
  String minExp = "";
  String salary = "";
  bool accomodation = false;
  bool food = false;
  bool overTime = false;
  String annualVacation = "";
  String otherBenefit = "";
  String contactPeriod = "";
  String applyBefore = "";
  Map? country;

  getData() async {
    countries = await JobsApi().getCountries();
    setState(() {});
  }

  @override
  void initState() {
    company = widget.company;
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              Item(
                width: width,
                title: "Company",
                widget: company == null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Add Company",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff101010)),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text("Name"),
                          TextField(
                            onChanged: (val) {
                              companyName = val;
                            },
                            decoration:
                                const InputDecoration(border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text("Address"),
                          TextField(
                            onChanged: (val) {
                              address = val;
                            },
                            decoration:
                                const InputDecoration(border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text("Logo Link"),
                          TextField(
                            onChanged: (val) {
                              logoLink = val;
                            },
                            decoration:
                                const InputDecoration(border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text("Email"),
                          TextField(
                            onChanged: (val) {
                              email = val;
                            },
                            decoration:
                                const InputDecoration(border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text("Phone"),
                          TextField(
                            onChanged: (val) {
                              phone = val;
                            },
                            decoration:
                                const InputDecoration(border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (!addingCompany &&
                                  companyName != "" &&
                                  address != "" &&
                                  logoLink != "" &&
                                  email != "" &&
                                  phone != "") {
                                setState(() {
                                  addingCompany = true;
                                });
                                int? id = await JobsApi().addCompany(
                                    companyName,
                                    address,
                                    logoLink,
                                    email,
                                    phone);
                                if (id != null) {
                                  bool success = await JobsApi().assignCompany(
                                      widget.employerId, id.toString());
                                  if (success) {
                                    company = CompanyModel(
                                        id: id.toString(),
                                        address: address,
                                        contactNumber: phone,
                                        email: email,
                                        logo: logoLink,
                                        name: companyName);
                                    setState(() {});
                                  }
                                }

                                setState(() {
                                  addingCompany = false;
                                });
                              }
                            },
                            child: Container(
                              width: width * .16,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: myColors.darkgreen,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: addingCompany
                                    ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Text(
                                        "ADD",
                                        style: TextStyle(color: Colors.white),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : ListTile(
                        leading: Image.network(company!.logo!),
                        title: Text(company!.name!),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(company!.address!),
                            Text(company!.contactNumber!),
                            Text(company!.email!),
                          ],
                        ),
                      ),
              ),
              const SizedBox(
                height: 16,
              ),
              Item(
                width: width,
                title: "Country",
                widget: SizedBox(
                  width: width,
                  child: Wrap(children: [
                    for (Map country in countries)
                      CountrySelector(
                        country: country["country"],
                        code: country["code"],
                      ),
                    const SizedBox(
                      height: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Add Country",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff101010)),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text("Name"),
                        TextField(
                          onChanged: (val) {
                            countryName = val;
                          },
                          decoration:
                              const InputDecoration(border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text("Alpha Two Code"),
                        TextField(
                          onChanged: (val) {
                            alpha2Code = val;
                          },
                          decoration:
                              const InputDecoration(border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (!addingCountry &&
                                alpha2Code != "" &&
                                countryName != "") {
                              setState(() {
                                addingCountry = true;
                              });
                              CountryModel country = CountryModel(
                                  alpha2: alpha2Code, name: countryName);
                              await JobsApi().addCountry(country);
                              countries.add(
                                  {"country": countryName, "code": alpha2Code});
                              setState(() {
                                addingCountry = false;
                              });
                            }
                          },
                          child: Container(
                            width: width * .16,
                            height: 40,
                            decoration: BoxDecoration(
                                color: myColors.darkgreen,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: addingCountry
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ))
                                  : const Text(
                                      "ADD",
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Item(
                width: width,
                title: "Job",
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Add Job",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff101010)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Title"),
                              TextField(
                                onChanged: (val) {
                                  title = val;
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Category"),
                              TextField(
                                onChanged: (val) {
                                  category = val;
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text("Description"),
                    TextField(
                      onChanged: (val) {
                        description = val;
                      },
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text("Requirement"),
                    TextField(
                      onChanged: (val) {
                        requirement = val;
                      },
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text("Minimum Qualification"),
                    TextField(
                      onChanged: (val) {
                        minQualification = val;
                      },
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: width,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Required Number"),
                              SizedBox(
                                height: 40,
                                width: 64,
                                child: TextField(
                                  onChanged: (val) {
                                    requiredNum = val;
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Hours Per Day"),
                              SizedBox(
                                height: 40,
                                width: 64,
                                child: TextField(
                                  onChanged: (val) {
                                    hoursPDay = val;
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Hours Per Week"),
                              SizedBox(
                                height: 40,
                                width: 64,
                                child: TextField(
                                  onChanged: (val) {
                                    hoursPWeek = val;
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Min Experience"),
                              SizedBox(
                                height: 40,
                                width: 64,
                                child: TextField(
                                  onChanged: (val) {
                                    minExp = val;
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Salary"),
                              SizedBox(
                                height: 40,
                                width: 84,
                                child: TextField(
                                  onChanged: (val) {
                                    salary = val;
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Contact Period"),
                              SizedBox(
                                height: 40,
                                width: 132,
                                child: TextField(
                                  onChanged: (val) {
                                    contactPeriod = val;
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Apply Before (YYYY-MM-DD)"),
                              SizedBox(
                                height: 40,
                                width: 234,
                                child: TextField(
                                  onChanged: (val) {
                                    applyBefore = val;
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Country"),
                              PopupMenuButton(
                                onSelected: (nc) {
                                  setState(() {
                                    country = nc;
                                  });
                                },
                                itemBuilder: (context) => [
                                  for (Map c in countries)
                                    PopupMenuItem(
                                      value: c,
                                      child: Text(c["country"]),
                                    )
                                ],
                                child: SizedBox(
                                  height: 40,
                                  width: 234,
                                  child: TextField(
                                    enabled: false,
                                    decoration: InputDecoration(
                                        hintText: country == null
                                            ? ""
                                            : country!["country"],
                                        border: const OutlineInputBorder()),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 40,
                      width: width,
                      child: Row(
                        children: [
                          const Text("Accomodation"),
                          const SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                              width: 40,
                              height: 40,
                              child: Checkbox(
                                value: true,
                                onChanged: (val) {
                                  setState(() {
                                    accomodation = val!;
                                  });
                                },
                              )),
                          const SizedBox(
                            width: 32,
                          ),
                          const Text("Food"),
                          const SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                              width: 40,
                              height: 40,
                              child: Checkbox(
                                value: true,
                                onChanged: (val) {
                                  setState(() {
                                    food = val!;
                                  });
                                },
                              )),
                          const SizedBox(
                            width: 32,
                          ),
                          const Text("Overtime"),
                          const SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                              width: 40,
                              height: 40,
                              child: Checkbox(
                                value: true,
                                onChanged: (val) {
                                  setState(() {
                                    overTime = val!;
                                  });
                                },
                              )),
                          const SizedBox(
                            width: 32,
                          ),
                          const Text("Annual Vacation"),
                          const SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                            width: 132,
                            child: TextField(
                              onChanged: (val) {
                                annualVacation = val;
                              },
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.only(left: 4)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text("Other Benifits"),
                    TextField(
                      onChanged: (val) {
                        otherBenefit = val;
                      },
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (!addingJob &&
                            title != "" &&
                            category != "" &&
                            description != "" &&
                            requirement != "" &&
                            minQualification != "" &&
                            requiredNum != "" &&
                            hoursPDay != "" &&
                            hoursPWeek != "" &&
                            minExp != "" &&
                            salary != "" &&
                            annualVacation != "" &&
                            otherBenefit != "" &&
                            applyBefore != "" &&
                            contactPeriod != "" &&
                            country != null) {
                          setState(() {
                            addingJob = true;
                          });
                          log(company!.id.toString());
                          bool result = await JobsApi().addJob(
                              title: title,
                              accomodation: accomodation,
                              annualVacation: annualVacation,
                              category: category,
                              companyId: company!.id!,
                              description: description,
                              food: food,
                              hoursPDay: hoursPDay,
                              hoursPWeek: hoursPWeek,
                              minExp: minExp,
                              minQualification: minQualification,
                              otherBenefit: otherBenefit,
                              overTime: overTime,
                              requiredNum: requiredNum,
                              salary: salary,
                              requirement: requirement,
                              applyBefore: applyBefore,
                              contractPeriod: contactPeriod,
                              country: country!["id"].toString());
                          if (result) {
                            Get.dialog(const Center(
                              child: Dialog(
                                child: SizedBox(
                                  width: 132,
                                  height: 54,
                                  child: Center(
                                      child: Text("Successfully Created")),
                                ),
                              ),
                            ));
                          } else {
                            Get.dialog(const Center(
                              child: Dialog(
                                child: SizedBox(
                                  width: 132,
                                  height: 54,
                                  child: Center(
                                      child: Text("Please Try Again Later")),
                                ),
                              ),
                            ));
                          }
                          setState(() {
                            addingJob = false;
                          });
                        }
                      },
                      child: Container(
                        width: width * .16,
                        height: 40,
                        decoration: BoxDecoration(
                            color: myColors.darkgreen,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: addingJob
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                      color: Colors.white),
                                )
                              : const Text(
                                  "ADD",
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Item extends StatefulWidget {
  const Item({
    super.key,
    required this.width,
    required this.widget,
    required this.title,
  });

  final double width;
  final Widget widget;
  final String title;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 0.5, color: const Color(0xff141414))),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                active = !active;
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Row(children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                SizedBox(
                    height: 20,
                    width: 20,
                    child: active
                        ? const Icon(Icons.arrow_upward)
                        : const Icon(
                            Icons.arrow_downward,
                            color: Colors.black,
                          ))
              ]),
            ),
          ),
          if (active) widget.widget
        ],
      ),
    );
  }
}

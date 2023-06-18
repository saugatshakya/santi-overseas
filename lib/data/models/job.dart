import 'package:testapp/data/models/company.dart';
import 'package:testapp/data/models/country.dart';

class JobModel {
  int? id;
  String? title;
  int? requiredNumbers;
  String? category;
  int? workingHoursPerDay;
  int? workingDaysPerWeek;
  String? postedOn;
  String? applyBefore;
  String? contractPeriod;
  String? description;
  String? minQualification;
  int? minExperience;
  String? ageRequirement;
  String? skills;
  String? otherRequirement;
  int? salary;
  int? earning;
  String? accommodation;
  String? food;
  String? annualVacation;
  bool? overTime;
  String? otherBenefits;
  CompanyModel? company;
  String? createdAt;
  String? updatedAt;
  CountryModel? country;

  JobModel(
      {this.id,
      this.title,
      this.requiredNumbers,
      this.category,
      this.workingHoursPerDay,
      this.workingDaysPerWeek,
      this.postedOn,
      this.applyBefore,
      this.contractPeriod,
      this.description,
      this.minQualification,
      this.minExperience,
      this.ageRequirement,
      this.skills,
      this.otherRequirement,
      this.salary,
      this.earning,
      this.accommodation,
      this.food,
      this.annualVacation,
      this.overTime,
      this.otherBenefits,
      this.company,
      this.createdAt,
      this.updatedAt,
      this.country});

  JobModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    requiredNumbers = json['required_numbers'];
    category = json['category'];
    workingHoursPerDay = json['working_hours_per_day'];
    workingDaysPerWeek = json['working_days_per_week'];
    postedOn = json['posted_on'];
    applyBefore = json['apply_before'];
    contractPeriod = json['contract_period'];
    description = json['description'];
    minQualification = json['min_qualification'];
    minExperience = json['min_experience'];
    ageRequirement = json['age_requirement'];
    skills = json['skills'];
    otherRequirement = json['other_requirement'];
    salary = json["salary"] == null ? 0 : json['salary'].truncate();
    earning = json['earning'] == null ? 0 : json['earning'].truncate();
    accommodation = json['accommodation'];
    food = json['food'];
    annualVacation = json['annual_vacation'];
    overTime = json['over_time'];
    otherBenefits = json['other_benefits'];
    company = json['company'] != null
        ? CompanyModel.fromJson(json['company'], null)
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    country =
        json['country'] != null ? CountryModel.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['required_numbers'] = requiredNumbers;
    data['category'] = category;
    data['working_hours_per_day'] = workingHoursPerDay;
    data['working_days_per_week'] = workingDaysPerWeek;
    data['posted_on'] = postedOn;
    data['apply_before'] = applyBefore;
    data['contract_period'] = contractPeriod;
    data['description'] = description;
    data['min_qualification'] = minQualification;
    data['min_experience'] = minExperience;
    data['age_requirement'] = ageRequirement;
    data['skills'] = skills;
    data['other_requirement'] = otherRequirement;
    data['salary'] = salary;
    data['earning'] = earning;
    data['accommodation'] = accommodation;
    data['food'] = food;
    data['annual_vacation'] = annualVacation;
    data['over_time'] = overTime;
    data['other_benefits'] = otherBenefits;
    if (company != null) {
      data['company'] = company!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    return data;
  }
}

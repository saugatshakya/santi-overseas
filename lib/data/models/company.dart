class CompanyModel {
  String? id;
  String? name;
  String? address;
  String? email;
  String? contactNumber;
  String? logo;

  CompanyModel(
      {this.id,
      this.logo,
      this.name,
      this.address,
      this.email,
      this.contactNumber});

  CompanyModel.fromJson(Map<String, dynamic> json, String? newId) {
    id = newId ?? json["id"];
    name = json['name'];
    address = json['address'];
    email = json['email'];
    contactNumber = json['contact_number'];
    logo = json["logo"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['email'] = email;
    data['contact_number'] = contactNumber;
    data['logo'] = logo;
    return data;
  }
}

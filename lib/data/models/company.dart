class CompanyModel {
  String? name;
  String? address;
  String? email;
  String? contactNumber;

  CompanyModel({this.name, this.address, this.email, this.contactNumber});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    email = json['email'];
    contactNumber = json['contact_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['email'] = email;
    data['contact_number'] = contactNumber;
    return data;
  }
}

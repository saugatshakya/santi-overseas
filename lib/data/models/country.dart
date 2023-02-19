class CountryModel {
  String? name;
  String? alpha2;

  CountryModel({this.name, this.alpha2});

  CountryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alpha2 = json['alpha2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['alpha2'] = alpha2;
    return data;
  }
}

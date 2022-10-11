import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserContractorInformationModel {
  UserContractorInformationModel({
    this.name,
    this.lastName,
    this.adress,
    this.number,
    this.city,
  });

  String? name;
  String? lastName;
  String? adress;
  String? number;
  String? city;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'lastName': lastName,
      'adress': adress,
      'number': number,
      'cidade': city,
    };
  }

  factory UserContractorInformationModel.fromMap(Map<String, dynamic> map) {
    return UserContractorInformationModel(
      name: map['name'] != null ? map['name'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      adress: map['adress'] != null ? map['adress'] as String : null,
      number: map['number'] != null ? map['number'] as String : null,
      city: map['cidade'] != null ? map['cidade'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserContractorInformationModel.fromJson(String source) =>
      UserContractorInformationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

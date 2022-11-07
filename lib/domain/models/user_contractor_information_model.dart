import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserContractorInformationModel {
  UserContractorInformationModel({
    this.imageAvatar,
    this.name,
    this.lastName,
    this.adress,
    this.number,
    this.city,
    this.id,
    this.userType
  });

  String? name;
  String? imageAvatar;
  String? lastName;
  String? adress;
  String? number;
  String? city;
  String? id;
  String? userType;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageAvatar': imageAvatar,
      'name': name,
      'last_name': lastName,
      'adress': adress,
      'number': number,
      'cidade': city,
      'userType': userType,
    };
  }

  factory UserContractorInformationModel.fromMap(Map<String, dynamic> map) {
    return UserContractorInformationModel(
      imageAvatar:
          map['imageAvatar'] != null ? map['imageAvatar'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      lastName: map['last_name'] != null ? map['last_name'] as String : null,
      adress: map['adress'] != null ? map['adress'] as String : null,
      number: map['number'] != null ? map['number'] as String : null,
      city: map['cidade'] != null ? map['cidade'] as String : null,
      userType: map['userType'] != null ? map['userType'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserContractorInformationModel.fromJson(String source) =>
      UserContractorInformationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserContractorInformationModel {
  String? name;
  String? imageAvatar;
  String? lastName;
  String? adress;
  String? number;
  String? city;
  String? id;
  String? userType;
  String? deviceToken;
  UserContractorInformationModel({
    this.name,
    this.imageAvatar,
    this.lastName,
    this.adress,
    this.number,
    this.city,
    this.id,
    this.userType,
    this.deviceToken,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageAvatar': imageAvatar,
      'lastName': lastName,
      'adress': adress,
      'number': number,
      'city': city,
      'id': id,
      'userType': userType,
      'deviceToken': deviceToken,
    };
  }

  factory UserContractorInformationModel.fromMap(Map<String, dynamic> map) {
    return UserContractorInformationModel(
      name: map['name'] != null ? map['name'] as String : null,
      imageAvatar: map['imageAvatar'] != null ? map['imageAvatar'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      adress: map['adress'] != null ? map['adress'] as String : null,
      number: map['number'] != null ? map['number'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      userType: map['userType'] != null ? map['userType'] as String : null,
      deviceToken: map['deviceToken'] != null ? map['deviceToken'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserContractorInformationModel.fromJson(String source) => UserContractorInformationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

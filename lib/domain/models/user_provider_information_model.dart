import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserProviderInformationModel {
  String? name;
  String? lastName;
  String? phoneNumber;
  String? cpfOrCnpj;
  String? atuationArea;
  String? serviceDescription;
  String? expirenceTime;
  String? city;
  UserProviderInformationModel({
    this.name,
    this.lastName,
    this.phoneNumber,
    this.cpfOrCnpj,
    this.atuationArea,
    this.serviceDescription,
    this.expirenceTime,
    this.city,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'cpfOrCnpj': cpfOrCnpj,
      'atuationArea': atuationArea,
      'serviceDescription': serviceDescription,
      'expirenceTime': expirenceTime,
      'city': city,
    };
  }

  factory UserProviderInformationModel.fromMap(Map<String, dynamic> map) {
    return UserProviderInformationModel(
      name: map['name'] != null ? map['name'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      cpfOrCnpj: map['cpfOrCnpj'] != null ? map['cpfOrCnpj'] as String : null,
      atuationArea: map['atuationArea'] != null ? map['atuationArea'] as String : null,
      serviceDescription: map['serviceDescription'] != null ? map['serviceDescription'] as String : null,
      expirenceTime: map['expirenceTime'] != null ? map['expirenceTime'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProviderInformationModel.fromJson(String source) => UserProviderInformationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserProviderInformationModel {
  String? name;
  String? lastName;
  String? phoneNumber;
  String? cpfOrCnpj;
  String? atuationArea;
  String? serviceDescription;
  String? experienceTime;
  String? city;
  UserProviderInformationModel({
    this.name,
    this.lastName,
    this.phoneNumber,
    this.cpfOrCnpj,
    this.atuationArea,
    this.serviceDescription,
    this.experienceTime,
    this.city,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'cpf_or_cnpj': cpfOrCnpj,
      'atuation_area': atuationArea,
      'service_description': serviceDescription,
      'experience_time': experienceTime,
      'city': city,
    };
  }

  factory UserProviderInformationModel.fromMap(Map<String, dynamic> map) {
    return UserProviderInformationModel(
      name: map['name'] != null ? map['name'] as String : null,
      lastName: map['last_name'] != null ? map['last_name'] as String : null,
      phoneNumber: map['phone_number'] != null ? map['phone_number'] as String : null,
      cpfOrCnpj: map['cpf_or_cnpj'] != null ? map['cpf_or_cnpj'] as String : null,
      atuationArea: map['atuation_area'] != null ? map['atuation_area'] as String : null,
      serviceDescription: map['service_description'] != null ? map['service_description'] as String : null,
      experienceTime: map['experience_time'] != null ? map['experience_time'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProviderInformationModel.fromJson(String source) => UserProviderInformationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

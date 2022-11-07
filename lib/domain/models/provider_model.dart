import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProviderModel {
  final String imageAvatar;
  final String deviceToken;
  final String userType;
  final String id;
  final String name;
  final String atuationArea;
  final String city;
  final String experienceTime;
  final String lastName;
  final String phoneNumber;
  final String serviceDescription;
  final List<String> photos;
  ProviderModel({
    required this.imageAvatar,
    required this.deviceToken,
    required this.userType,
    required this.id,
    required this.name,
    required this.atuationArea,
    required this.city,
    required this.experienceTime,
    required this.lastName,
    required this.phoneNumber,
    required this.serviceDescription,
    required this.photos,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageAvatar': imageAvatar,
      'deviceToken': deviceToken,
      'userType': userType,
      'id': id,
      'name': name,
      'atuationArea': atuationArea,
      'city': city,
      'experienceTime': experienceTime,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'serviceDescription': serviceDescription,
      'photos': photos,
    };
  }

  factory ProviderModel.fromMap(Map<String, dynamic> map) {
    return ProviderModel(
      imageAvatar: map['imageAvatar'] as String,
      deviceToken: map['deviceToken'] as String,
      userType: map['userType'] as String,
      id: map['id'] as String,
      name: map['name'] as String,
      atuationArea: map['atuationArea'] as String,
      city: map['city'] as String,
      experienceTime: map['experienceTime'] as String,
      lastName: map['lastName'] as String,
      phoneNumber: map['phoneNumber'] as String,
      serviceDescription: map['serviceDescription'] as String,
      photos: List<String>.from(
        (map['photos'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProviderModel.fromJson(String source) =>
      ProviderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

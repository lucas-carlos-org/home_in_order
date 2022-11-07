import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserAuthModel {
  UserAuthModel({
    this.name,
    this.email,
    this.imageAvatar,
    this.deviceToken,
    this.userType,
    this.completeRegisterData,
    this.completeRegisterPhoto,
    this.isFirstTime,
    this.id,
  });
  String? name;
  String? email;
  String? imageAvatar;
  String? deviceToken;
  String? userType;
  bool? completeRegisterData;
  bool? completeRegisterPhoto;
  bool? isFirstTime;
  String? id;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'image_avatar': imageAvatar,
      'device_token': deviceToken,
      'user_type': userType,
      'complete_register_data': completeRegisterData,
      'complete_register_photo': completeRegisterPhoto,
      'is_first_time': isFirstTime,
      'id': id,
    };
  }

  factory UserAuthModel.fromMap(Map<String, dynamic> map) {
    return UserAuthModel(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      imageAvatar:
          map['image_avatar'] != null ? map['image_avatar'] as String : null,
      deviceToken:
          map['device_token'] != null ? map['device_token'] as String : null,
      userType: map['user_type'] != null ? map['user_type'] as String : null,
      completeRegisterData: map['complete_register_data'] != null
          ? map['complete_register_data'] as bool
          : null,
      completeRegisterPhoto: map['complete_register_photo'] != null
          ? map['complete_register_photo'] as bool
          : null,
      isFirstTime:
          map['is_first_time'] != null ? map['is_first_time'] as bool : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAuthModel.fromJson(String source) =>
      UserAuthModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

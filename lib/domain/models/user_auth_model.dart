import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserAuthModel {
  UserAuthModel({
    this.name,
    this.email,
    this.imageAvatar,
    this.diveceToken,
    this.userType,
    this.completeRegisterData,
    this.completeRegisterPhoto,
    this.isFirstTime,
  });
  String? name;
  String? email;
  String? imageAvatar;
  String? diveceToken;
  String? userType;
  bool? completeRegisterData;
  bool? completeRegisterPhoto;
  bool? isFirstTime;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'imageAvatar': imageAvatar,
      'diveceToken': diveceToken,
      'userType': userType,
      'completeRegisterData': completeRegisterData,
      'completeRegisterPhoto': completeRegisterPhoto,
      'isFirstTime': isFirstTime,
    };
  }

  factory UserAuthModel.fromMap(Map<String, dynamic> map) {
    return UserAuthModel(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      imageAvatar:
          map['imageAvatar'] != null ? map['imageAvatar'] as String : null,
      diveceToken:
          map['diveceToken'] != null ? map['diveceToken'] as String : null,
      userType: map['userType'] != null ? map['userType'] as String : null,
      completeRegisterData: map['completeRegisterData'] != null
          ? map['completeRegisterData'] as bool
          : null,
      completeRegisterPhoto: map['completeRegisterPhoto'] != null
          ? map['completeRegisterPhoto'] as bool
          : null,
      isFirstTime:
          map['isFirstTime'] != null ? map['isFirstTime'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAuthModel.fromJson(String source) =>
      UserAuthModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'dart:convert';

class UserAuthModel {
  UserAuthModel({
    this.name,
    this.email,
    this.imageAvatar,
    this.diveceToken,
    this.userType,
  });

  String? name;
  String? email;
  String? imageAvatar;
  String? diveceToken;
  String? userType;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'imageAvatar': imageAvatar,
      'diveceToken': diveceToken,
      'userType': userType,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAuthModel.fromJson(String source) =>
      UserAuthModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

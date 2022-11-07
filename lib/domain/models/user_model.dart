import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final String imageAvatar;
  final String name;
  UserModel({
    required this.imageAvatar,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageAvatar': imageAvatar,
      'name': name,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      imageAvatar: map['imageAvatar'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProviderHistoricModel {
  final String imageAvatar;
  final String name;
  ProviderHistoricModel({
    required this.imageAvatar,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageAvatar': imageAvatar,
      'name': name,
    };
  }

  factory ProviderHistoricModel.fromMap(Map<String, dynamic> map) {
    return ProviderHistoricModel(
      imageAvatar: map['imageAvatar'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProviderHistoricModel.fromJson(String source) =>
      ProviderHistoricModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

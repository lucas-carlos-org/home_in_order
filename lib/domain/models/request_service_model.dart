// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:home_in_order/domain/models/file_model.dart';

class RequestServiceModel {
  final String contractorId;
  final String providerId;
  final String id;
  final String imageAvatar;
  final String name;
  final String deviceToken;
  final String description;
  final String city;
  final String address;
  final String number;
  final DateTime createAt;
  final String? status;
  late final List<FileModel> files;
  RequestServiceModel({
    required this.contractorId,
    required this.providerId,
    required this.id,
    required this.imageAvatar,
    required this.name,
    required this.deviceToken,
    required this.description,
    required this.city,
    required this.address,
    required this.number,
    required this.createAt,
    required this.files,
    this.status,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contractorId': contractorId,
      'providerId': providerId,
      'id': id,
      'imageAvatar': imageAvatar,
      'name': name,
      'deviceToken': deviceToken,
      'description': description,
      'city': city,
      'address': address,
      'number': number,
      'createAt': createAt,
      'status': status,
      'files': files.map((x) => x.toMap()).toList(),
    };
  }

  factory RequestServiceModel.fromMap(Map<String, dynamic> map) {
    return RequestServiceModel(
      contractorId: map['contractorId'] as String,
      providerId: map['providerId'] as String,
      id: map['id'] as String,
      imageAvatar: map['imageAvatar'] as String,
      name: map['name'] as String,
      deviceToken: map['deviceToken'] as String,
      description: map['description'] as String,
      city: map['city'] as String,
      address: map['address'] as String,
      number: map['number'] as String,
      createAt: DateTime(map['createAt'] as int),
      status: map['status'] as String,
      files: List<FileModel>.from((map['files'] as List<int>).map<FileModel>((x) => FileModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestServiceModel.fromJson(String source) => RequestServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

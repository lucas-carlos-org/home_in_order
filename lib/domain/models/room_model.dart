// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:home_in_order/domain/models/user_contractor_information_model.dart';

class RoomModel {
  String? roomId;
  int? createAt;
  int? updateAt;
  List<String>? users;
  String? lasMessage;
  UserContractorInformationModel? userInformation;

  RoomModel({
    this.roomId,
    this.createAt,
    this.updateAt,
    this.users,
    this.lasMessage,
    this.userInformation,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'roomId': roomId,
      'createAt': createAt,
      'updateAt': updateAt,
      'users': users,
      'lasMessage': lasMessage,
    };
  }

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      roomId: map['roomId'] != null ? map['roomId'] as String : null,
      createAt: map['createAt'] != null ? map['createAt'] as int : null,
      updateAt: map['updateAt'] != null ? map['updateAt'] as int : null,
      users: map['users'] != null ? List<String>.from((map['users'] as List<String>)) : null,
      lasMessage: map['lasMessage'] != null ? map['lasMessage'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomModel.fromJson(String source) => RoomModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'dart:convert';
// ignore_for_file: public_member_api_docs, sort_constructors_first
class ScheduleModel {
  final String documentId;
  final String idContractor;
  final String idProvider;
  final String userName;
  final String description;
  final String hour;
  final String address;
  final String? date;
  ScheduleModel({
    required this.documentId,
    required this.idContractor,
    required this.idProvider,
    required this.userName,
    required this.description,
    required this.hour,
    required this.address,
    this.date,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'documentId': documentId,
      'idContractor': idContractor,
      'idProvider': idProvider,
      'date': date,
      'userName': userName,
      'description': description,
      'address': address,
      'hour': hour,
    };
  }

  factory ScheduleModel.fromMap(Map<String, dynamic> map) {
    return ScheduleModel(
      documentId: map['documentId'] as String,
      idContractor: map['idContractor'] as String,
      idProvider: map['idProvider'] as String,
      date: map['date'] as String,
      userName: map['userName'] as String,
      description: map['description'] as String,
      address: map['address'] as String,
      hour: map['hour'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduleModel.fromJson(String source) => ScheduleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'dart:convert';
// ignore_for_file: public_member_api_docs, sort_constructors_first
class ScheduleModel {
  final String docId;
  final String idContractor;
  final String idProvider;
  final String userName;
  final String description;
  final String hour;
  final String address;
  final String providerName;
  final String? date;
  ScheduleModel({
    required this.docId,
    required this.idContractor,
    required this.idProvider,
    required this.userName,
    required this.providerName,
    required this.description,
    required this.hour,
    required this.address,
    this.date,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docId': docId,
      'idContractor': idContractor,
      'idProvider': idProvider,
      'date': date,
      'userName': userName,
      'providerName': providerName,
      'description': description,
      'address': address,
      'hour': hour,
    };
  }

  factory ScheduleModel.fromMap(Map<String, dynamic> map) {
    return ScheduleModel(
      docId: map['docId'] as String,
      idContractor: map['idContractor'] as String,
      idProvider: map['idProvider'] as String,
      date: map['date'] as String,
      userName: map['userName'] as String,
      providerName: map['providerName'] as String,
      description: map['description'] as String,
      address: map['address'] as String,
      hour: map['hour'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduleModel.fromJson(String source) => ScheduleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

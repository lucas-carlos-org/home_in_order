// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class RequestServiceModel {
  final String descriptionProblem;

  RequestServiceModel(this.descriptionProblem);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'descriptionProblem': descriptionProblem,
    };
  }

  factory RequestServiceModel.fromMap(Map<String, dynamic> map) {
    return RequestServiceModel(
      map['descriptionProblem'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestServiceModel.fromJson(String source) => RequestServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

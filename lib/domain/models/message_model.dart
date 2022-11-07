import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Message {
  final String text;
  final DateTime date;

  Message(
    this.text,
    this.date,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      map['text'] as String,
      DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source) as Map<String, dynamic>);
}

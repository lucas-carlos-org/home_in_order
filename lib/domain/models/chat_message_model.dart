// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatMessageModel {
  int? createdAt;
  String? sender;
  String? text;

  ChatMessageModel({
    this.createdAt,
    this.sender,
    this.text,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdAt': createdAt,
      'sender': sender,
      'text': text,
    };
  }

  factory ChatMessageModel.fromMap(Map<String, dynamic> map) {
    return ChatMessageModel(
      createdAt: map['createdAt'] != null ? map['createdAt'] as int : null,
      sender: map['sender'] != null ? map['sender'] as String : null,
      text: map['text'] != null ? map['text'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessageModel.fromJson(String source) => ChatMessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

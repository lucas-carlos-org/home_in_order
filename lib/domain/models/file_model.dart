import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class FileModel {
  String pathFile;
  FileModel({
    required this.pathFile,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path_file': pathFile,
    };
  }

  factory FileModel.fromMap(Map<String, dynamic> map) {
    return FileModel(
      pathFile: map['path_file'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FileModel.fromJson(String source) =>
      FileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

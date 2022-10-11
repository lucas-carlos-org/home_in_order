import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class FileModels {
  String pathFile;
  FileModels({
    required this.pathFile,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pathFile': pathFile,
    };
  }

  factory FileModels.fromMap(Map<String, dynamic> map) {
    return FileModels(
      pathFile: map['pathFile'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FileModels.fromJson(String source) => FileModels.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'dart:convert';

class FileModel {
  final String imagePath;

  FileModel({
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'image_path': imagePath,
    };
  }

  factory FileModel.fromMap(Map<String, dynamic> map) {
    return FileModel(
      imagePath: map['imagePath'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FileModel.fromJson(String source) =>
      FileModel.fromMap(json.decode(source));
}

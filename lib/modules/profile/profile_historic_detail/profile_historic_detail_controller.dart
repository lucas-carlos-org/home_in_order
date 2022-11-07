import 'package:get/get.dart';
import 'package:home_in_order/domain/models/file_model.dart';

class ProfileHistoricDetailController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    final data = Get.arguments;
    dataValues = data[0];
    documentId = data[1];
    userType.value = data[2];
    getListFiles();
  }

  String? documentId;
  final userType = ''.obs;
  dynamic dataValues;
  final listFiles = <FileModel>[].obs;

  void getListFiles() {
    final files =
        List<Map<String, dynamic>>.from(dataValues['files'] as List<dynamic>);
    for (var i = 0; i < files.length; i++) {
      listFiles.add(FileModel(imagePath: files[i]['image_path']));
    }
  }
}

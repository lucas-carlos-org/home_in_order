import 'package:image_picker/image_picker.dart';

abstract class IImageGateway {
  Future<XFile?> getImageFromCamera();
  Future<XFile?> getImageFromGallery();
}

class ImageGatewayImpl implements IImageGateway {
  ImageGatewayImpl() {
    imagePicker = ImagePicker();
  }

  late final ImagePicker imagePicker;
  XFile? imagePath;

  @override
  Future<XFile?> getImageFromCamera() async {
    final image = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 60,
      maxHeight: 1280,
      maxWidth: 1280,
    );

    if (image != null) {
      return image;
    } else {
      return null;
    }
  }

  @override
  Future<XFile?> getImageFromGallery() async {
    final image = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      return image;
    } else {
      return null;
    }
  }

    
}

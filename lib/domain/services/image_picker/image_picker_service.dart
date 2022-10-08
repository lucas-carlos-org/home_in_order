abstract class IImagePickerService {
  Future<String?> getImageFromCamera();
  Future<String?> getImageFromGallery();
}
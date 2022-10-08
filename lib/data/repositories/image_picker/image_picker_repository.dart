abstract class IImagePickerRepository {
  Future<String?> getImageFromCamera();
  Future<String?> getImageFromGallery();
}

import 'package:home_in_order/data/repositories/image_picker/image_picker_repository.dart';
import 'package:home_in_order/domain/services/image_picker/image_picker_service.dart';

class ImagePickerServiceImpl implements IImagePickerService {
  ImagePickerServiceImpl({
    required IImagePickerRepository imagePickerRepository,
  }) : _imagePickerRepository = imagePickerRepository;

  final IImagePickerRepository _imagePickerRepository;

  @override
  Future<String?> getImageFromCamera() async {
    final onboardingImage = await _imagePickerRepository.getImageFromCamera();
    return onboardingImage;
  }

  @override
  Future<String?> getImageFromGallery() async {
    final onboardingImage = await _imagePickerRepository.getImageFromGallery();
    return onboardingImage;
  }
}

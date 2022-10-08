import 'package:home_in_order/data/gateways/image_picker/image_picker_gateway.dart';
import 'package:home_in_order/data/repositories/image_picker/image_picker_repository.dart';

class ImagePickerRepositoryImpl implements IImagePickerRepository {
  ImagePickerRepositoryImpl({
    required IImageGateway imageGateway,
  }) : _imageGateway = imageGateway;

  final IImageGateway _imageGateway;

  @override
  Future<String?> getImageFromCamera() async {
    final rawPath = await _imageGateway.getImageFromCamera();

    return rawPath?.path;
  }

  @override
  Future<String?> getImageFromGallery() async {
    final rawPath = await _imageGateway.getImageFromGallery();

    return rawPath?.path;
  }
}

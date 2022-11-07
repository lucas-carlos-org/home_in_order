import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({required this.imagePath, Key? key}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: PhotoView(
      imageProvider: CachedNetworkImageProvider(
        imagePath,
      ),
    ),
  );
}

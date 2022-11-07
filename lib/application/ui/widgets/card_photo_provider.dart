import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/photo_view.dart';

class CardPhoto extends StatelessWidget {
  const CardPhoto({Key? key, this.imagePath}) : super(key: key);

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      child: InkWell(
        onTap: () => Get.to(
          () => PhotoWidget(imagePath: imagePath!),
        ),
        child: Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(24),
            image: DecorationImage(
              image: CachedNetworkImageProvider(imagePath!),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';

class CardPhoto extends StatelessWidget {
  const CardPhoto({Key? key, this.imagePath}) : super(key: key);

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      child: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(24),
           image: DecorationImage(
            image: NetworkImage(imagePath!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

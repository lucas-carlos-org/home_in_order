import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.isCenterTitle = false})
      : super(key: key);

  final String title;
  final String subTitle;
  final bool isCenterTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: isCenterTitle ? Alignment.center : Alignment.centerLeft,
          child: Text(
            title,
            maxLines: 2,
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          subTitle,
          maxLines: 4,
          style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey.withOpacity(0.8),
              height: 1.5),
        ),
        SizedBox(
          height: 40.h,
        ),
      ],
    );
  }
}

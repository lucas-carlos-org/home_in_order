import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Divider(
                  thickness: 2,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(label),
              ),
              const Expanded(
                child: Divider(
                  thickness: 1,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 22.h,
          )
        ],
      ),
    );
  }
}

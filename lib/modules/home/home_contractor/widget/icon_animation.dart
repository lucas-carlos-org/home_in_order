// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:lottie/lottie.dart';

class IconAnimation extends StatefulWidget {
  const IconAnimation({Key? key, this.onPressed}) : super(key: key);

  final VoidCallback? onPressed;

  @override
  _IconAnimationState createState() => _IconAnimationState();
}

class _IconAnimationState extends State<IconAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool checked = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.duration = const Duration(milliseconds: 500);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  toggle() {
    (!checked) ? _controller.forward() : _controller.reset();
    checked = !checked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggle();
        widget.onPressed?.call();
      },
      child: Container(
        height: 30.h,
        width: 30.w,
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: 23.sp,
          child: Lottie.asset(
            "assets/images/refresh.json",
            controller: _controller,
          ),
        ),
      ),
    );
  }
}

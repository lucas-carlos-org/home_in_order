import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';

class InfoWidget extends StatelessWidget {
  InfoWidget({Key? key, required this.infoMessage}) : super(key: key);

  final String infoMessage;

  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Tooltip(
          preferBelow: true,
          verticalOffset: 20,
          margin: EdgeInsets.symmetric(horizontal: 22.w),
          padding: const EdgeInsets.all(5),
          key: tooltipkey,
          triggerMode: TooltipTriggerMode.manual,
          showDuration: const Duration(seconds: 1),
          message: infoMessage,
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => tooltipkey.currentState?.ensureTooltipVisible(),
            icon: const Icon(
              Icons.info_outline,
              shadows: [
                Shadow(
                  color: Colors.black26,
                  offset: Offset.zero,
                  blurRadius: 15,
                ),
              ],
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}

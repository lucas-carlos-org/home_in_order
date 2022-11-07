import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:intl/intl.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.message,
    required this.sender,
    required this.createdAt,
  }) : super(key: key);

  final String message;
  final bool sender;
  final int createdAt;

  @override
  Widget build(BuildContext context) {
    final dateFormated = DateTime.fromMillisecondsSinceEpoch(createdAt);
    DateFormat dateFormat = DateFormat('HH:mm');

    final messageTextGroup = Flexible(
      child: Padding(
        padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 8.h),
        child: Row(
          mainAxisAlignment:
              !sender ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment:
                    !sender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: !sender ? const Color(0xff1976D2) : Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18.r),
                        topLeft: Radius.circular(18.r),
                        bottomLeft:
                            !sender ? Radius.circular(18.r) : Radius.zero,
                        bottomRight:
                            !sender ? Radius.zero : Radius.circular(18.r),
                      ),
                    ),
                    child: Text(
                      message,
                      style: TextStyle(
                        color: !sender ? Colors.white : Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Align(
                    alignment:
                        !sender ? Alignment.bottomRight : Alignment.bottomLeft,
                    child: Text(
                      dateFormat.format(dateFormated),
                      style: TextStyle(
                        color: /* isProvider ? Colors.white : */ Colors.black,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 30),
          messageTextGroup,
        ],
      ),
    );
  }
}

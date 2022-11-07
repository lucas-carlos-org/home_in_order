// ignore_for_file: unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:intl/intl.dart';

class ChatListCard extends StatelessWidget {
  const ChatListCard({
    Key? key,
    required this.imageAvatar,
    required this.name,
    required this.date,
    required this.lastMessage,
    required this.userId,
    required this.onTap,
  }) : super(key: key);

  final String imageAvatar;
  final String name;
  final String lastMessage;
  final int date;
  final String userId;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dateFormated = DateTime.fromMillisecondsSinceEpoch(date);
    DateFormat dateFormat = DateFormat('HH:mm');

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: SizedBox(
          height: 70.h,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 8.w,
                  ),
                  CircleAvatar(
                    radius: 25.r,
                    backgroundImage: CachedNetworkImageProvider(imageAvatar),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6.sp,
                      ),
                      Visibility(
                        visible: lastMessage.isNotEmpty,
                        child: SizedBox(
                          width: 200.w,
                          child: Text(
                            lastMessage,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: lastMessage.isEmpty
                    ? const SizedBox.shrink()
                    : Text(dateFormat.format(dateFormated)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

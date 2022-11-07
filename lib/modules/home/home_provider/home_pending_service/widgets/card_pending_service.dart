import 'package:avatar_glow/avatar_glow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';

class CardPendingService extends StatelessWidget {
  const CardPendingService({
    Key? key,
    required this.avatar,
    required this.name,
    required this.titleDescription,
    required this.data,
    required this.documentId,
    required this.address,
    required this.number,
    required this.city,
    required this.createAt,
  }) : super(key: key);

  final String documentId;
  final String avatar;
  final String name;
  final String titleDescription;
  final String address;
  final String number;
  final String city;
  final String createAt;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Container(
        width: double.infinity,
        height: 71.h,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.03),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: avatar,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 30.r,
                          backgroundImage: imageProvider,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      AvatarGlow(
                        endRadius: 10.r,
                        glowColor: Colors.orange,
                        child: Material(
                            shape: const CircleBorder(),
                            child: Container(
                              height: 10.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 218, 103, 10),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 150.w,
                        child: Text(
                          titleDescription,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () => Get.toNamed('/detail-contractor',
                    arguments: [data, documentId]),
                child: Container(
                  width: 66.w,
                  height: 23.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    color: const Color(0xff1976D2),
                  ),
                  child: Center(
                    child: Text(
                      'Detalhes',
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

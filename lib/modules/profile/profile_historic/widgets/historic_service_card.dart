// ignore_for_file: unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/modules/profile/profile_historic/historic_controller.dart';
import 'package:intl/intl.dart';

class HistoricServiceCard extends GetView<HistoricController> {
  const HistoricServiceCard({
    Key? key,
    required this.avatar,
    required this.date,
    required this.name,
    required this.titleDescription,
    required this.status,
    required this.documentId,
    required this.data,
    required this.userType,
  }) : super(key: key);

  final String avatar;
  final DateTime date;
  final String name;
  final String titleDescription;
  final String status;
  final String documentId;
  final String userType;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final formatDate = DateFormat('dd/MM/yyyy');

    return InkWell(
      onTap: () => Get.toNamed(
        '/historic-detail',
        arguments: [data, documentId, userType],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 22.w),
            child: Container(
              width: double.infinity,
              height: 71.h,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.03),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: avatar,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                imageBuilder: (context, imageProvider) =>
                                    CircleAvatar(
                                  radius: 30.r,
                                  backgroundImage: imageProvider,
                                  backgroundColor: Colors.transparent,
                                ),
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
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 150.w,
                                child: Text(
                                  titleDescription,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          Text(
                            formatDate.format(date),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: const Divider(
              thickness: 1,
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}

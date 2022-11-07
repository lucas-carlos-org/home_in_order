import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/domain/models/provider_model.dart';

class HomeProviderCard extends StatelessWidget {
  const HomeProviderCard({
    Key? key,
    required this.imageAvatar,
    required this.name,
    required this.service,
    required this.listProvider,
    required this.listProviderPhotos,
  }) : super(key: key);

  final String imageAvatar;
  final String name;
  final String service;
  final ProviderModel listProvider;
  final List<String> listProviderPhotos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: InkWell(
        onTap: () => Get.toNamed(
          '/detail-provider',
          arguments: [
            listProvider,
            listProviderPhotos,
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          height: 80.h,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r), // Image border
                child: SizedBox(
                  width: 80.w,
                  height: 80.h,
                  child: CachedNetworkImage(
                    imageUrl: imageAvatar,
                    placeholder: (context, url) => const Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 22.sp, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            service,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

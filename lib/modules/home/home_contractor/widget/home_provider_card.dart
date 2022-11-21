import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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
              CachedNetworkImage(
                imageUrl: imageAvatar,
                imageBuilder: (context, imageProvider) => Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const SizedBox(
                  height: 80,
                  width: 80,
                  child: Center(
                    child: CupertinoActivityIndicator(
                      animating: true,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: Theme.of(context).primaryColor,
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

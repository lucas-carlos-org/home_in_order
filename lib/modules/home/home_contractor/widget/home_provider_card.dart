import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/domain/models/user_auth_model.dart';
import 'package:home_in_order/domain/models/user_provider_information_model.dart';

class HomeProviderCard extends StatelessWidget {
  const HomeProviderCard({
    Key? key,
    required this.imageAvatar,
    required this.name,
    required this.service,
    required this.listProviders,
    required this.listProviderInfo,
  }) : super(key: key);

  final String imageAvatar;
  final String name;
  final String service;
  final UserAuthModel listProviders;
  final UserProviderInformationModel listProviderInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: InkWell(
        onTap: () {},
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
                  child: Image.network(imageAvatar, fit: BoxFit.cover),
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/modules/profile/profile_user/profile_user_controller.dart';

class ProfileUserPage extends GetView<ProfileUserController> {
  const ProfileUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.h,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerProfile(context),
                  stackBodyProfile(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Stack stackBodyProfile() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Container(
            height: 260.h,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 213.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.05),
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 58.h,
                        width: 58.w,
                        decoration: BoxDecoration(
                          color: const Color(0xff77E3FF),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50.r),
                            topLeft: Radius.circular(24.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 58.h,
                        width: 58.w,
                        decoration: BoxDecoration(
                          color: const Color(0xff1976D2),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.r),
                            bottomRight: Radius.circular(24.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: SizedBox(
                height: 80.h,
                width: 80.w,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    Obx(
                      () {
                        return controller.userModel.value?.imageAvatar == null
                            ? const SizedBox.shrink()
                            : CachedNetworkImage(
                                imageUrl:
                                    controller.userModel.value!.imageAvatar,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                imageBuilder: (context, imageProvider) =>
                                    CircleAvatar(
                                  radius: 35.r,
                                  backgroundImage: imageProvider,
                                  backgroundColor: Colors.transparent,
                                ),
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: 120.h,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Obx(() {
                  return Text(
                    controller.userModel.value?.name == null
                        ? ''
                        : controller.userModel.value!.name,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                  );
                }),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Resumo',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Column(
                  children: [
                    Obx(() {
                      return Text(
                        controller.serviceCount.value.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.sp),
                      );
                    }),
                    Text(
                      'Total de Serviços',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 10.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300.h,
              ),
              Text(
                'CONTA',
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () => Get.toNamed('/profile-data',
                    arguments: [controller.userModel.value]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 42.h,
                          width: 42.w,
                          decoration: BoxDecoration(
                              color: const Color(0xffE7F0F9),
                              borderRadius: BorderRadius.circular(12.r)),
                          child: const Icon(
                            Icons.description_outlined,
                            color: Color(0xff1976D2),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Text('Dados'),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey.withOpacity(0.5),
                      size: 15.sp,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () => Get.toNamed('/historic'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 42.h,
                          width: 42.w,
                          decoration: BoxDecoration(
                              color: const Color(0xffE7F0F9),
                              borderRadius: BorderRadius.circular(12.r)),
                          child: const Icon(
                            Icons.home_repair_service_outlined,
                            color: Color(0xff1976D2),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Text('Histórico de serviços'),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey.withOpacity(0.5),
                      size: 15.sp,
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Padding headerProfile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 32.0),
          Text(
            'Perfil',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          InkWell(
            onTap: () => controller.logout(),
            child: Text(
              'Sair',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

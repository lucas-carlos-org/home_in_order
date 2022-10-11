import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_back_button.dart';
import './profile_provider_controller.dart';

class ProfileProviderPage extends GetView<ProfileProviderController> {
  const ProfileProviderPage({Key? key}) : super(key: key);

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
                  headerProfileProvider(),
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
          padding: EdgeInsets.symmetric(horizontal: 30.w),
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
                    CircleAvatar(
                      radius: 35.r,
                      backgroundImage: const NetworkImage(
                          "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=2000"),
                      backgroundColor: Colors.transparent,
                    ),
                    Positioned.fill(
                      bottom: -20.h,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: RawMaterialButton(
                          onPressed: () {},
                          elevation: 2.0,
                          fillColor: const Color(0xFFF5F6F9),
                          padding: const EdgeInsets.all(2),
                          shape: const CircleBorder(),
                          // ignore: prefer_const_constructors
                          child: Icon(
                            size: 15.sp,
                            Icons.camera_alt_outlined,
                            color: Colors.blue,
                          ),
                        ),
                      ),
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
                Text(
                  'Ciclano de Tal',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          '31',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16.sp),
                        ),
                        Text(
                          'Serviços',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 10.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      height: 30.h,
                      width: 1.w,
                      color: Colors.black26,
                      margin: EdgeInsets.only(left: 10.w, right: 10.w),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Text(
                          '5',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16.sp),
                        ),
                        Text(
                          'Finalizados',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 10.sp),
                        ),
                      ],
                    )
                  ],
                )
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
              Row(
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
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey.withOpacity(0.5),
                        size: 15.sp,
                      ))
                ],
              ),
              Row(
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
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey.withOpacity(0.5),
                        size: 15.sp,
                      ))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Row headerProfileProvider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomBackButton(),
        Text(
          'Perfil',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        TextButton(
          onPressed: () => controller.logout(),
          child: const Text('Sair'),
        )
      ],
    );
  }
}

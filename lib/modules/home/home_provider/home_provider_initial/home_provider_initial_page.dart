import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/modules/home/home_provider/home_active_service/home_active_service_page.dart';
import 'package:home_in_order/modules/home/home_provider/home_pending_service/home_pending_service_page.dart';
import 'package:home_in_order/modules/home/home_provider/home_provider_initial/home_provider_initial_controller.dart';

class HomeProviderInitialPage extends GetView<HomeProviderInitialController> {
  const HomeProviderInitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        title: headerHomeProviderPage(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 103.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff1976D2),
                borderRadius: BorderRadius.circular(10.r),
              ),
              alignment: Alignment.centerRight,
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Serviços',
              style: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w700),
            ),
            Obx(() {
              return DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      child: TabBar(
                        labelColor: Theme.of(context).primaryColor,
                        unselectedLabelColor: Colors.grey,
                        tabs: const [
                          Tab(text: 'Pendentes'),
                          Tab(text: 'Ativos'),
                        ],
                      ),
                    ),
                    Container(
                      height: 400.h,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5),
                        ),
                      ),
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          HomePendingServicePage(
                              userId: controller.userId.value),
                          HomeActiveServicePage(userId: controller.userId.value)
                        ],
                      ),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Padding headerHomeProviderPage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () {
              return Row(
                children: [
                  Text(
                    'Olá, ',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                  Text(
                    controller.userModelInfo.value?.name ?? '',
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Image.asset('assets/icons/emoji_home_provider.png',
                      height: 25.h)
                ],
              );
            },
          ),
          Obx(
            () {
              return controller.userModel.value?.imageAvatar == null
                  ? const SizedBox.shrink()
                  : CircleAvatar(
                      radius: 20.r,
                      backgroundImage: NetworkImage(
                        controller.userModel.value!.imageAvatar.toString(),
                      ),
                      backgroundColor: Colors.transparent,
                    );
            },
          )
        ],
      ),
    );
  }
}

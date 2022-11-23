import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/modules/home/home_provider/home_active_service/home_active_service_page.dart';
import 'package:home_in_order/modules/home/home_provider/home_pending_service/home_pending_service_page.dart';
import 'package:home_in_order/modules/home/home_provider/home_provider_initial/home_provider_initial_controller.dart';
import 'package:home_in_order/modules/home/home_provider/home_provider_initial/widgets/button_schedule.dart';

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
            const ButtonSchedule(),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Solicitações',
              style: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w700),
            ),
            Expanded(
              child: DefaultTabController(
                length: controller.myTabs.length,
                child: Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 10.h,
                    bottom: TabBar(
                      labelColor: Theme.of(context).primaryColor,
                      unselectedLabelColor: Colors.grey,
                      tabs: controller.myTabs,
                    ),
                  ),
                  body: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: controller.myTabs.map((Tab tab) {
                      final String label = tab.text!.toLowerCase();
                      return Center(
                        child: label == 'pendentes'
                            ? HomePendingServicePage(
                                userId: controller.userId.value)
                            : HomeActiveServicePage(
                                userId: controller.userId.value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
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
                  Text(
                    '🤗',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  )
                ],
              );
            },
          ),
          Obx(
            () {
              return controller.userModel.value?.imageAvatar == null
                  ? const SizedBox.shrink()
                  : InkWell(
                      onTap: () {
                        controller.changePage(3);
                      },
                      child: CachedNetworkImage(
                        imageUrl:
                            controller.userModel.value!.imageAvatar.toString(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 20.r,
                          backgroundImage: imageProvider,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    );
            },
          )
        ],
      ),
    );
  }
}

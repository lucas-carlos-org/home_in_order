import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_search_widget.dart';
import 'package:home_in_order/modules/home/home_contractor/home_contractor_controller.dart';
import 'package:home_in_order/modules/home/home_contractor/widget/home_provider_card.dart';

class HomeContractorPage extends GetView<HomeContractorController> {
  const HomeContractorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        title: headerHomeContractorPage(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSearchWidget(hintText: 'Serviço, Localidade, Nome'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                'Prestadores de serviço',
                style: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    itemCount: controller.listProviders.length,
                    itemBuilder: (context, index) {
                      var provider = controller.listProviders[index];
                      var providerInfo = controller.listProviderInfo[index];
                      return HomeProviderCard(
                        listProviderInfo: providerInfo,
                        listProviders: provider,
                        listProviderPhotos: controller.listProviderPhotos,
                        imageAvatar: '${provider.imageAvatar}',
                        name:
                            '${providerInfo.name} ${providerInfo.lastName![0]}.',
                        service: '${providerInfo.atuationArea}',
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding headerHomeContractorPage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Olá, ',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
              Obx(() {
                return Text(
                  controller.userModelInfo.value?.name ?? '',
                  style: TextStyle(fontSize: 16.sp, color: Colors.black),
                );
              }),
              SizedBox(
                width: 4.w,
              ),
              Image.asset('assets/icons/emoji_home_contractor.png',
                  height: 25.h)
            ],
          ),
          Obx(
            () {
              return controller.userModel.value?.imageAvatar == null
                  ? const SizedBox.shrink()
                  : CircleAvatar(
                      radius: 20.r,
                      backgroundImage: NetworkImage(
                          controller.userModel.value!.imageAvatar!),
                      backgroundColor: Colors.transparent,
                    );
            },
          )
        ],
      ),
    );
  }
}

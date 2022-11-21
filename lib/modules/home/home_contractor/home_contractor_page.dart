import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_search_widget.dart';
import 'package:home_in_order/modules/home/home_contractor/home_contractor_controller.dart';
import 'package:home_in_order/modules/home/home_contractor/widget/home_provider_card.dart';
import 'package:home_in_order/modules/home/home_contractor/widget/icon_animation.dart';

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
            Obx(() {
              return CustomSearchWidget(
                hintText: 'Pesquisar por ${controller.selectedValue.value}',
                onChanged: (value) => controller.searchItemByService(value),
                suffixIcon: const SizedBox.shrink(),
              );
            }),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Prestadores de serviço',
                    style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconAnimation(
                    onPressed: () => controller.getDocs(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  return controller.isLoading.value
                      ? const Center(
                          child: CupertinoActivityIndicator(
                            animating: true,
                          ),
                        )
                      : controller.searching.value
                          ? const Center(
                              child: Text(
                                  'Nenhum prestador de serviço encontrado!'),
                            )
                          : controller.listProvider.isNotEmpty
                              ? ListView.builder(
                                  physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics(),
                                  ),
                                  itemCount: controller.listProvider.length,
                                  itemBuilder: (context, index) {
                                    var provider =
                                        controller.listProvider[index];
                                    return HomeProviderCard(
                                      listProvider: provider,
                                      listProviderPhotos: provider.photos,
                                      imageAvatar: provider.imageAvatar,
                                      name:
                                          '${provider.name} ${provider.lastName[0]}.',
                                      service: provider.atuationArea,
                                    );
                                  },
                                )
                              : const Center(
                                  child: Text(
                                      'Nenhum prestador de serviço encontrado!'),
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
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
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
                  color: Colors.black,
                ),
              ),
              Obx(() {
                return Text(
                  controller.userModel.value?.name ?? '',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                );
              }),
              SizedBox(
                width: 4.w,
              ),
              Text(
                '🥰',
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              )
            ],
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
                        imageUrl: controller.userModel.value!.imageAvatar,
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

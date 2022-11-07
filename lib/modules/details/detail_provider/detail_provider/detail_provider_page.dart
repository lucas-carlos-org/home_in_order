import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/widgets/custom_back_button.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/domain/models/provider_model.dart';
import 'package:home_in_order/modules/details/detail_provider/detail_provider/widgets/card_info_provider.dart';
import 'package:home_in_order/application/ui/widgets/card_photo_provider.dart';
import './detail_provider_controller.dart';

class DetailProviderPage extends GetView<DetailProviderController> {
  const DetailProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;

    final ProviderModel providerModel = data[0];
    final List<String> userProviderPhotos = data[1];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.h,
        leading: const CustomBackButton(),
        automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: IntrinsicHeight(
              child: Column(
                children: [
                  headerPageComponent(providerModel),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          '${providerModel.name} ${providerModel.lastName[0]}.',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 22.sp),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          providerModel.atuationArea,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CardInfoProvider(
                                title: 'Cidade', subTitle: providerModel.city),
                            CardInfoProvider(
                                title: 'Experiência',
                                subTitle:
                                    '${providerModel.experienceTime} anos'),
                            const CardInfoProvider(
                                title: 'Avaliação', subTitle: '4.6'),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'Sobre',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 17.sp),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          providerModel.serviceDescription,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: Colors.black54,
                              height: 1.5),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'Fotos',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 17.sp),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        SizedBox(
                          height: 100.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: userProviderPhotos.length,
                            itemBuilder: (context, index) {
                              return CardPhoto(
                                imagePath: userProviderPhotos[index],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: CustomElevatedButton(
                      label: 'Fazer Solicitação',
                      onPressed: () => Get.toNamed(
                        '/contract-provider',
                        arguments: [
                          providerModel,
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Stack headerPageComponent(ProviderModel providerModel) {
    return Stack(
      children: [
        Container(
          height: 250.h,
          width: double.infinity,
          color: Colors.transparent,
          child: Image(
            image: CachedNetworkImageProvider(providerModel.imageAvatar),
            fit: BoxFit.cover,
          ),
        ),
        const CustomBackButton(),
      ],
    );
  }
}

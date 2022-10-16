import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/widgets/custom_back_button.dart';
import 'package:home_in_order/application/ui/widgets/custom_elevated_button.dart';
import 'package:home_in_order/domain/models/user_auth_model.dart';
import 'package:home_in_order/domain/models/user_provider_information_model.dart';
import 'package:home_in_order/modules/details/detail_provider/detail_provider/widgets/card_info_provider.dart';
import 'package:home_in_order/application/ui/widgets/card_photo_provider.dart';
import './detail_provider_controller.dart';

class DetailProviderPage extends GetView<DetailProviderController> {
  const DetailProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;

    final UserAuthModel userAuthModel = data[0];
    final UserProviderInformationModel userProviderModel = data[1];
    final List<String> userProviderPhotos = data[2];

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
                  headerPageComponent(userAuthModel),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          '${userProviderModel.name} ${userProviderModel.lastName![0]}.',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 22.sp),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          '${userProviderModel.atuationArea}',
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
                                title: 'Cidade',
                                subTitle: '${userProviderModel.city}'),
                            CardInfoProvider(
                                title: 'Experiência',
                                subTitle:
                                    '${userProviderModel.experienceTime} anos'),
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
                          '${userProviderModel.serviceDescription}',
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
                        /*    Row(
                            children: userProviderPhotos
                                .map((e) => CardPhoto(
                                      imagePath: e,
                                    ))
                                .toList()), */
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: CustomElevatedButton(
                      label: 'Fazer Solicitação',
                      onPressed: () => Get.toNamed('/contract-provider',
                          arguments: [userAuthModel, userProviderModel]),
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

  Stack headerPageComponent(UserAuthModel userAuthModel) {
    return Stack(
      children: [
        Container(
          height: 250.h,
          width: double.infinity,
          color: Colors.transparent,
          child: Image(
            image: NetworkImage(userAuthModel.imageAvatar!),
            fit: BoxFit.cover,
          ),
        ),
        const CustomBackButton(),
      ],
    );
  }
}

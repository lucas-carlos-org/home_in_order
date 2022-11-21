import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_back_button.dart';
import 'package:home_in_order/domain/models/provider_model.dart';
import 'package:home_in_order/modules/details/detail_provider/contract_provider/widgets/form_photo_provider.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_data/widgets/custom_textformfield_multiline.dart';
import './contract_provider_controller.dart';

class ContractProviderPage extends GetView<ContractProviderController> {
  const ContractProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  headerComponent(controller.providerModel.value!),
                  titleComponent(controller.providerModel.value!),
                  SizedBox(
                    height: 12.h,
                  ),
                  FormPhotoProvider(
                 
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding titleComponent(ProviderModel providerModel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          Text(
            '${providerModel.name} ${providerModel.lastName[0]}.',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.sp),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            providerModel.atuationArea,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }

  Stack headerComponent(ProviderModel providerModel) {
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

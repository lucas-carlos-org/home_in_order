import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_title.dart';
import 'package:home_in_order/modules/registration/registration_contractor/registration_contractor_data/widgets/registration_contactor_form.dart';
import './registration_contractor_data_controller.dart';

class RegistrationContractorDataPage
    extends GetView<RegistrationContractorDataController> {
  const RegistrationContractorDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 22.w, right: 22.w, top: 16.h),
                    child: const CustomTitle(
                      title: 'Complete seu cadastro ',
                      subTitle:
                          'Finalize seu cadastro para começar a utilizar o aplicativo!',
                    ),
                  ),
                  RegistrationContactorForm()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
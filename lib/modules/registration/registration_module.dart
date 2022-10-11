import 'package:get/get.dart';
import 'package:home_in_order/application/modules/module.dart';
import 'package:home_in_order/modules/registration/registration_contractor/registration_contractor_data/registration_contractor_data_bindings.dart';
import 'package:home_in_order/modules/registration/registration_contractor/registration_contractor_data/registration_contractor_data_page.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_data/registration_provider_bindings.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_data/registration_provider_page.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_photo/registration_provider_photo_bindings.dart';
import 'package:home_in_order/modules/registration/registration_provider/registration_provider_photo/registration_provider_photo_page.dart';

class RegistrationModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage<dynamic>(
      name: '/registration-contractor-data',
      page: () => const RegistrationContractorDataPage(),
      binding: RegistrationContractorDataBindings(),
    ),
    GetPage<dynamic>(
      name: '/registration-provider-data',
      page: () => const RegistrationProviderDataPage(),
      binding: RegistrationProviderBindings(),
    ),
    GetPage<dynamic>(
      name: '/registration-provider-photo',
      page: () => const RegistrationProviderPhotoPage(),
      binding: RegistrationProviderPhotoBindings(),
    ),
  ];
}

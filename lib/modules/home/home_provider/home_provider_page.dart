import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/modules/home/home_provider/home_provider_controller.dart';

class HomeProviderPage extends GetView<HomeProviderController> {
  const HomeProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeProviderPage'),
      ),
      body: Container(),
    );
  }
}

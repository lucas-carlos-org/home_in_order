import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './profile_contractor_controller.dart';

class ProfileContractorPage extends GetView<ProfileContractorController> {
    
    const ProfileContractorPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('ProfileContractorPage'),),
            body: Container(),
        );
    }
}
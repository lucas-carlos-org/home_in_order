import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './schedule_controller.dart';

class SchedulePage extends GetView<ScheduleController> {
    
    const SchedulePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('SchedulePage'),),
            body: Container(),
        );
    }
}
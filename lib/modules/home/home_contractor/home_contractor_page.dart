import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/modules/home/home_contractor/home_contractor_controller.dart';

class HomeContractorPage extends GetView<HomeContractorController> {
  const HomeContractorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Text('Olá, '),
            const Text('Fulano de tal'),
            Image.asset(
              'assets/icons/home_user_emoji.png',
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: const NetworkImage(
                "https://images.vexels.com/media/users/3/145908/raw/52eabf633ca6414e60a7677b0b917d92-criador-de-avatar-masculino.jpg"),
            backgroundColor: Colors.transparent,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Agendamento de Tarefas'),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.info_outline_rounded,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Prestadores de Serviço'),
                TextButton(
                  onPressed: () {
                    controller.logout();
                  },
                  child: const Text('Ver mais'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

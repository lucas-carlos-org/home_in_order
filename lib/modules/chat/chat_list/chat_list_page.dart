import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/domain/models/room_model.dart';
import 'package:home_in_order/modules/chat/chat_list/chat_list_controller.dart';
import 'package:home_in_order/modules/chat/chat_list/widgets/chat_list_card.dart';
import 'package:infinity_scroll/widget/infinite_scroll_widget.dart';

class ChatListPage extends GetView<ChatListController> {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.h,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
        child: Obx(
          () {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                headerTitle(),
                SizedBox(
                  height: 18.h,
                ),
                Expanded(
                  child: InfiniteScrollWidget<RoomModel>(
                    list: controller.rooms,
                    delegate: (context, item, index) => ChatListCard(
                      onTap: () {
                        controller.navigateToDetail(
                            item.userInformation!.id!,
                            '${item.userInformation?.name} ${item.userInformation?.lastName?[0]}.');
                      },
                      imageAvatar: item.userInformation?.imageAvatar ?? '',
                      name:
                          '${item.userInformation?.name} ${item.userInformation?.lastName?[0]}.',
                      date: item.updateAt!,
                      lastMessage: item.lasMessage ?? '',
                      userId: item.userInformation!.id!,
                    ),
                    onLoadMore: () async {},
                    onRefresh: () async {
                      await controller.onRefresh();
                    },
                    reachMax: true,
                    isLoading: controller.isLoading.value,
                    customReachMax: const SizedBox.shrink(),
                    customLoader: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    customEmptyList: const Center(
                      child: Text('Você não possui nenhum chat!'),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Column headerTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mensagens',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xff1976D2),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          'Este canal serve exclusivamente para tirar dúvidas sobre o serviço contratado, bem como a realização do agendamento.',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

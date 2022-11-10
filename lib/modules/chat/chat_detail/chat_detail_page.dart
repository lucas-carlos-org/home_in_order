import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';
import 'package:home_in_order/application/ui/widgets/custom_back_button.dart';
import 'package:home_in_order/modules/chat/chat_detail/widgets/chat_bubble.dart';
import './chat_detail_controller.dart';

class ChatDetailPage extends GetView<ChatDetailController> {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageEC = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xffF7F7FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black38,
        automaticallyImplyLeading: false,
        toolbarHeight: 70.h,
        title: headerHomeContractorPage(),
        actions: <Widget>[
          Obx(
            () => controller.userType.value == 'provider'
                ? Row(
                    children: [
                      IconButton(
                        tooltip:
                            'O agendamento de horarios somente é possivel atraves do chat com usuario!',
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          Get.back();
                          Get.back();
                          controller.changePage(
                            1,
                          );
                          Get.toNamed(
                            '/schedule-create',
                            arguments: [
                              controller.userName.value,
                              controller.userData.value
                            ],
                          );
                        },
                        icon: const Icon(
                          Icons.calendar_month_outlined,
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            return Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                shrinkWrap: true,
                itemCount: controller.messages.length,
                reverse: true,
                itemBuilder: (context, index) {
                  final reversedIndex = controller.messages.length - 1 - index;
                  final item = controller.messages[reversedIndex];

                  return ChatBubble(
                    message: item.text ?? '',
                    sender: controller.isFromMe(item.sender!),
                    createdAt: item.createdAt!,
                  );
                },
              ),
            );
          }),
          bottomTextFormField(messageEC)
        ],
      ),
    );
  }

  Container bottomTextFormField(TextEditingController textEditingController) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            offset: Offset(0, 1), // Shadow position
          ),
        ],
      ),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          hintText: 'Mensagem',
          fillColor: Colors.white,
          filled: true,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 10.w),
                InkWell(
                  onTap: () {
                    controller.sendMessage(textEditingController.text);
                    textEditingController.clear();
                  },
                  child: const Icon(
                    Icons.send,
                    color: Color(0xff1976D2),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row headerHomeContractorPage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomBackButton(
              heightContainer: 30.h,
              widthContainer: 30.w,
              heightIcon: 12.h,
              widthIcon: 12.w,
            ),
            Obx(() {
              return Text(
                controller.userName.value,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              );
            })
          ],
        ),
      ],
    );
  }
}

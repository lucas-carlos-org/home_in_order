import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './chat_controller.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatPage'),
      ),
      body: Container(),
    );
  }
}

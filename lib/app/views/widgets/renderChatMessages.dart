import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:whats_app_clone/app/data/remotely/controllers/single_chat_controller.dart';
import 'package:whats_app_clone/app/views/widgets/receive_message.dart';
import 'package:whats_app_clone/app/views/widgets/send_mssage.dart';

class RenderChatMessages extends GetView<SingleChatController> {
  const RenderChatMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();
    return GetX<SingleChatController>(
      // init: SingleChatController(),
      builder: (controller) {
        return Expanded(
          // height: MediaQuery.of(context).size.height - 180,
          child: ListView.builder(
            shrinkWrap: true,
            controller: controller.scrollController,
            itemCount: controller.listMessages.length + 1,
            itemBuilder: (context, index) {
              // return Container();
              if (index == controller.listMessages.length) {
                return Container(height: 80);
              }
              if (controller.listMessages[index].type == "source") {
                return SentMessage(
                  message: controller.listMessages[index].name,
                  time: controller.listMessages[index].time,
                );
              } else {
                return ReceivedMessage(
                  message: controller.listMessages[index].name,
                  time: controller.listMessages[index].time,
                );
              }
            },
          ),
        );
      },
    );
  }
}

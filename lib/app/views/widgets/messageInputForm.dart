import 'package:flutter/material.dart';
import 'package:whats_app_clone/app/data/remotely/controllers/single_chat_controller.dart';
import 'package:whats_app_clone/app/views/widgets/renderEmojiKeyboard.dart';
import 'package:whats_app_clone/app/views/widgets/renderInputMsgSend.dart';

class MessageInputForm extends StatelessWidget {
  final SingleChatController controller;
  const MessageInputForm({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          // height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: <Widget>[
                  renderInputMsgSend(context, controller),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 22.0,
                      backgroundColor: Color(0xFF128C7E),
                      child: IconButton(
                        onPressed: () {
                          if (!controller.isSendMsgBtn) {
                            debugPrint(controller.msgController.text);
                            controller
                              ..sendMessage(
                                controller.msgController.text,
                                DateTime.now().hour.toString() +
                                    ":" +
                                    DateTime.now().minute.toString(),
                                1,
                                2,
                              );
                            controller.msgController.clear();
                            controller.animateChatScrollController();
                          }
                        },
                        icon: Icon(
                          controller.isSendMsgBtn
                              ? Icons.mic_rounded
                              : Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              controller.emojiShowing ? RenderEmojiKeyboard() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

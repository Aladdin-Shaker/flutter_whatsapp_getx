import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:io';

import 'package:whats_app_clone/app/data/remotely/controllers/single_chat_controller.dart';

class RenderEmojiKeyboard extends GetView<SingleChatController> {
  const RenderEmojiKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleChatController>(
      builder: (controller) {
        return (Offstage(
          offstage: !controller.emojiShowing,
          child: SizedBox(
            height: 250,
            child: EmojiPicker(
              onEmojiSelected: (Category category, Emoji emoji) {
                controller.onEmojiSelected(emoji);
              },
              onBackspacePressed: controller.onBackspacePressed,
              config: Config(
                columns: 7,
                emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                verticalSpacing: 0,
                horizontalSpacing: 0,
                initCategory: Category.RECENT,
                bgColor: const Color(0xFFF2F2F2),
                indicatorColor: Colors.blue,
                iconColor: Colors.grey,
                iconColorSelected: Colors.blue,
                progressIndicatorColor: Colors.blue,
                backspaceColor: Colors.blue,
                showRecentsTab: true,
                recentsLimit: 28,
                noRecentsText: 'No Recents',
                noRecentsStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.black26,
                ),
                tabIndicatorAnimDuration: kTabScrollDuration,
                categoryIcons: const CategoryIcons(),
                buttonMode: ButtonMode.MATERIAL,
              ),
            ),
          ),
        ));
      },
    );
  }
}

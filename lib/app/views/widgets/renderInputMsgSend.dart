import 'package:flutter/material.dart';
import 'package:whats_app_clone/app/data/remotely/controllers/single_chat_controller.dart';
import 'package:whats_app_clone/app/views/widgets/renderAttachFileCard.dart';

Widget renderInputMsgSend(
    BuildContext context, SingleChatController controller) {
  return Container(
    width: MediaQuery.of(context).size.width - 65,
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        controller: controller.msgController,
        cursorColor: Colors.black,
        showCursor: true,
        textAlignVertical: TextAlignVertical.center,
        focusNode: controller.focusNode,
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.black),
        maxLines: 5,
        minLines: 1,
        enableSuggestions: true,
        keyboardType: TextInputType.multiline,
        onChanged: (value) => {
          if (value.length > 0)
            {controller.isSendMsgBtn = false}
          else
            {controller.isSendMsgBtn = true}
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Type a message',
          focusColor: Color(0xFF128C7E),
          prefixIcon: IconButton(
            onPressed: () {
              debugPrint('emojiShowing => ${controller.emojiShowing}');
              if (controller.emojiShowing) {
                // close emoji and open keyboard
                controller.emojiShowing = false;
                controller.focusNode.canRequestFocus = true;
                controller.focusNode.requestFocus();
              } else {
                // close keyboard and open emoji
                controller.focusNode.unfocus();
                controller.focusNode.canRequestFocus = false;
                controller.emojiShowing = true;
              }
            },
            icon: controller.emojiShowing
                ? Icon(Icons.keyboard)
                : Icon(Icons.emoji_emotions_outlined),
            color: Color(0xFF128C7E),
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RenderAttachDataCard(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.camera_alt),
                color: Color(0xFF128C7E),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

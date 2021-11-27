import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whats_app_clone/app/models/chat.dart';
import 'package:whats_app_clone/app/views/pages/chat_page/singleChatPage.dart';

class ChatCard extends StatelessWidget {
  final ChatModel chat;
  const ChatCard(this.chat);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
          Get.to(() => SingleChatPage(chat));
        },
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 25.0,
                child: this.chat.isGroup
                    ? SvgPicture.asset(
                        "assets/images/groups_white_36dp.svg",
                        height: 35,
                        width: 35,
                      )
                    : SvgPicture.asset(
                        "assets/images/person_white_36dp.svg",
                        height: 35,
                        width: 35,
                      ),
              ),
              title: Text(
                this.chat.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(this.chat.date),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.done_all,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Text(this.chat.currentMessage),
                ],
              ),
            ),
            Divider(thickness: 0.5)
          ],
        ),
      ),
    );
  }
}

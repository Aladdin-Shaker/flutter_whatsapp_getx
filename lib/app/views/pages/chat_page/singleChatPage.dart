import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:whats_app_clone/app/data/remotely/controllers/single_chat_controller.dart';
import 'package:whats_app_clone/app/models/chat.dart';
import 'package:whats_app_clone/app/views/widgets/messageInputForm.dart';
import 'package:whats_app_clone/app/views/widgets/custom_app_bar.dart';
import 'package:whats_app_clone/app/views/widgets/renderChatMessages.dart';

class SingleChatPage extends GetView<SingleChatController> {
  final ChatModel chat;

  SingleChatPage(this.chat);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this.chat.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(
              'last seen today at ${this.chat.date}',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 20.0,
                child: this.chat.isGroup
                    ? SvgPicture.asset(
                        "assets/images/groups_white_36dp.svg",
                        height: 30,
                        width: 30,
                      )
                    : SvgPicture.asset(
                        "assets/images/person_white_36dp.svg",
                        height: 30,
                        width: 30,
                      ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.videocam,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.call,
              color: Colors.white,
            ),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Label chat'),
                  value: 'Label chat',
                  enabled: true,
                ),
                PopupMenuItem(
                  child: Text('View contact'),
                  value: 'View contact',
                  enabled: true,
                ),
                PopupMenuItem(
                  child: Text('Media, links, and docs'),
                  value: 'Media, links, and docs',
                  enabled: true,
                ),
                PopupMenuItem(
                  child: Text('Search'),
                  value: 'Search',
                  enabled: true,
                ),
                PopupMenuItem(
                  child: Text('Mute notifications'),
                  value: 'Mute notifications',
                  enabled: true,
                ),
                PopupMenuItem(
                  child: Text('Wallpaper'),
                  value: 'Wallpaper',
                  enabled: true,
                ),
              ];
            },
            tooltip: 'Menu',
            icon: Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: Colors.green[50],
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_chat.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: GetBuilder<SingleChatController>(
          init: SingleChatController(),
          builder: (controller) {
            return WillPopScope(
              onWillPop: () {
                if (controller.emojiShowing) {
                  controller.emojiShowing = false;
                } else {
                  Get.back();
                }
                return Future.value(false);
              },
              child: Column(
                children: <Widget>[
                  RenderChatMessages(),
                  MessageInputForm(controller: controller),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

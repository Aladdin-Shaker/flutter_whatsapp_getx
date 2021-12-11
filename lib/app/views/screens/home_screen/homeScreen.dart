import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:whats_app_clone/app/data/remotely/controllers/chats_controller.dart';
import 'package:whats_app_clone/app/views/pages/camera_page/cameraPage.dart';
import 'package:whats_app_clone/app/views/pages/chats_page/chatsPage.dart';
import 'package:whats_app_clone/app/views/pages/status_page/statusPage.dart';
import 'package:whats_app_clone/app/views/widgets/custom_app_bar.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen>
    with SingleTickerProviderStateMixin {
  ChatsController chatsCtrl = Get.put(ChatsController());

  @override
  void initState() {
    super.initState();
    chatsCtrl.tabController =
        TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: Text('Whatsapp Clone'),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('New Group'),
                  value: 'new group',
                  enabled: true,
                ),
                PopupMenuItem(
                  child: Text('New Broadcast'),
                  value: 'new broadcast',
                  enabled: true,
                ),
                PopupMenuItem(
                  child: Text('Whatsapp Web'),
                  value: 'whatsapp web',
                  enabled: true,
                ),
                PopupMenuItem(
                  child: Text('Starred Messages'),
                  value: 'starred messages',
                  enabled: true,
                ),
                PopupMenuItem(
                  child: Text('Settings'),
                  value: 'settings',
                  enabled: true,
                ),
              ];
            },
            tooltip: 'Menu',
            icon: Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            ),
          ),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: chatsCtrl.tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt_rounded),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            ),
          ],
        ),
        leading: null,
      ),
      body: TabBarView(
        controller: chatsCtrl.tabController,
        children: [
          CameraPage(),
          ChatsPage(),
          StatusPage(),
          Center(
            child: Text('CALLS'),
          ),
        ],
      ),
    );
  }
}

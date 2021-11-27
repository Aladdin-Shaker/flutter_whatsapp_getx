import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whats_app_clone/app/config/sizes.dart';
import 'package:whats_app_clone/app/data/remotely/controllers/chats_controller.dart';
import 'package:whats_app_clone/app/models/chat.dart';
import 'package:whats_app_clone/app/views/screens/selectedcontact_screen/selectContact.dart';
import 'package:whats_app_clone/app/views/widgets/chatCard.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => SelectContact());
        },
        child: Icon(Icons.chat),
      ),
      body: Container(
        child: GetX<ChatsController>(
          init: ChatsController(),
          builder: (controller) {
            return FutureBuilder<List<ChatModel>>(
              future: controller.listChats.value,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final ChatModel _chat = snapshot.data![index];
                      return ChatCard(_chat);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                }

                // By default, show a loading spinner.
                return SizedBox(
                  height: SizeConfig.screenHeight / 1.2,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:whats_app_clone/app/data/remotely/controllers/chats_controller.dart';
import 'package:whats_app_clone/app/data/remotely/controllers/single_chat_controller.dart';
import 'package:whats_app_clone/app/data/remotely/controllers/status_controller.dart';
import 'package:whats_app_clone/app/data/remotely/controllers/video_controller.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatsController>(() => ChatsController(), fenix: false);
    Get.lazyPut<ChatsController>(() => ChatsController());
    Get.lazyPut<VideoController>(() => VideoController());
    Get.lazyPut<StatusController>(() => StatusController());
    Get.lazyPut<SingleChatController>(() => SingleChatController());
  }
}

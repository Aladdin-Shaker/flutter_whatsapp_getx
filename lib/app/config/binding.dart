import 'package:get/get.dart';
import 'package:whats_app_clone/app/data/remotely/controllers/chats_controller.dart';
import 'package:whats_app_clone/app/data/remotely/controllers/single_chat_controller.dart';
import 'package:whats_app_clone/app/data/remotely/controllers/status_controller.dart';
import 'package:whats_app_clone/app/data/remotely/controllers/video_controller.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatsController>(
      () => ChatsController(),
      fenix: false,
      tag: 'chatCtrl',
    );
    Get.lazyPut<VideoController>(
      () => VideoController(),
      fenix: false,
      tag: 'videoCtrl',
    );
    Get.lazyPut<StatusController>(
      () => StatusController(),
      fenix: false,
      tag: 'statusCtrl',
    );
    Get.lazyPut<SingleChatController>(
      () => SingleChatController(),
      fenix: false,
      tag: 'singleChatCtrl',
    );
  }
}

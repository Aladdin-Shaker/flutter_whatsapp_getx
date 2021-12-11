import 'package:get/route_manager.dart';
import 'package:whats_app_clone/app/config/constants.dart';
import 'package:whats_app_clone/app/views/pages/camera_page/cameraViewPage.dart';
import 'package:whats_app_clone/app/views/pages/chats_page/chatsPage.dart';
import 'package:whats_app_clone/app/views/pages/status_page/statusPage.dart';

List<GetPage<dynamic>>? getPagesRoutes = [
  GetPage(
    name: cameraViewRoute,
    page: () => const CameraViewPage(path: ''),
    title: 'camera page',
  ),
  GetPage(
    name: chatsViewRoute,
    page: () => const ChatsPage(),
    title: 'chats page',
  ),
  GetPage(
    name: statusViewRoute,
    page: () => StatusPage(),
    title: 'chats page',
  ),
  // GetPage(
  //   name: callsViewRoute,
  //   page: () => const ChatsPage(),
  //   title: 'calls page',
  // ),
];

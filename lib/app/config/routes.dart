import 'package:get/route_manager.dart';
import 'package:whats_app_clone/app/config/constants.dart';
import 'package:whats_app_clone/app/views/screens/home_screen/homeScreen.dart';

List<GetPage<dynamic>>? getPagesRoutes = [
  GetPage(
    name: homeViewRoute,
    page: () => const HomeScreen(),
    title: 'home screen',
  ),
  // GetPage(
  //   name: cameraViewRoute,
  //   page: () => const CameraViewPage(path: ''),
  //   title: 'camera page',
  // ),
];

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

import 'package:whats_app_clone/app/config/binding.dart';
import 'package:whats_app_clone/app/config/constants.dart';
import 'package:whats_app_clone/app/config/routes.dart';
import 'package:whats_app_clone/app/config/theme.dart';
import 'package:whats_app_clone/app/utils/device_camera.dart';
import 'package:whats_app_clone/app/utils/device_info.dart';
import 'package:whats_app_clone/app/views/screens/landing_screen/landing_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

  try {
    MyDeviceInfo().initPlatformState();
    MyDeviceCamear().avCameras();
  } on CameraException catch (e) {
    logError(e.code, e.description);
  } on PlatformException catch (e) {
    deviceDataConstant = 'Error: Failed to get platform version.';
    logError(e.code, e.message);
  }
}

void logError(String code, String? message) {
  if (message != null) {
    print('Error: $code\nError Message: $message');
  } else {
    print('Error: $code');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      unknownRoute: GetPage(
        name: '/undefiend',
        page: () => Container(
            child: Center(
                child: Text(
          'Undefiend',
          style: TextStyle(
            color: Colors.white,
          ),
        ))),
      ),
      initialBinding: Binding(),
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      title: 'Whats app clone',
      theme: buildThemeData(),
      // home: const InitScreen(),
      home: LandingScreen(),
      getPages: getPagesRoutes,
    );

    // Widget build(BuildContext context) {
    //   return MaterialApp(
    //     title: 'Whatsapp Clone',
    //     home: InitScreen(),
    //     theme: ThemeData(
    //       fontFamily: 'OpenSans',
    //       primaryColor: Color(0xFF075E54),
    //       colorScheme: ColorScheme.fromSwatch().copyWith(
    //         secondary: Color(0xFF128C7E),
    //       ),
    //     ),
    //   );
    // }
  }
}

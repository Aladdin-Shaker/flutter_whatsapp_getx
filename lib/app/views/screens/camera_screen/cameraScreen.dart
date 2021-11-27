import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:whats_app_clone/app/data/remotely/controllers/video_controller.dart';

class CameraScreen extends GetView {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: GetBuilder<VideoController>(
        init: VideoController(),
        builder: (vidCtrl) {
          print(vidCtrl.initializeControllerFuture);
          return Stack(
            fit: StackFit.expand,
            children: [
              FutureBuilder<void>(
                future: vidCtrl.initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(vidCtrl.camController);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              // Positioned(
              //   bottom: 0.0,
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     height: MediaQuery.of(context).size.height / 8,
              //     alignment: Alignment.center,
              //     // color: Colors.black,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           mainAxisSize: MainAxisSize.max,
              //           children: [
              //             IconButton(
              //               onPressed: () => vidCtrl.handleFlash(),
              //               icon: vidCtrl.isFlashOn
              //                   ? Icon(
              //                       Icons.flash_on,
              //                       color: Colors.white,
              //                       size: 28,
              //                     )
              //                   : Icon(
              //                       Icons.flash_off,
              //                       color: Colors.white,
              //                       size: 28,
              //                     ),
              //             ),
              //             GestureDetector(
              //               onTap: () => vidCtrl.takePhoto(context),
              //               onLongPress: () => vidCtrl.startVideo(),
              //               onLongPressUp: () => vidCtrl.stopVideo(context),
              //               child: vidCtrl.isRecording
              //                   ? Icon(
              //                       Icons.radio_button_on,
              //                       color: Colors.red,
              //                       size: 70,
              //                     )
              //                   : Icon(
              //                       Icons.panorama_fish_eye,
              //                       color: Colors.white,
              //                       size: 70,
              //                     ),
              //             ),
              //             IconButton(
              //               onPressed: () => vidCtrl.handleSwitchCamera(),
              //               icon: Transform.rotate(
              //                 angle: vidCtrl.transform,
              //                 child: Icon(
              //                   Icons.flip_camera_ios_sharp,
              //                   color: Colors.white,
              //                   size: 28,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //         // SizedBox(height: 5),
              //         Spacer(),
              //         Container(
              //           color: Colors.black,
              //           child: Row(
              //             crossAxisAlignment: CrossAxisAlignment.end,
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text(
              //                 'Hold for video, tap for photo',
              //                 style: TextStyle(
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}

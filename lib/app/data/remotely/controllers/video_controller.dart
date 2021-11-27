import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whats_app_clone/app/config/constants.dart';
import 'package:whats_app_clone/app/views/pages/camera_page/cameraViewPage.dart';
import 'package:whats_app_clone/app/views/pages/video_page/videoViewPage.dart';
import 'package:whats_app_clone/root/contracts/rootController.dart';
import 'dart:math';

class VideoController extends RootController {
  late CameraController camController;
  late Future<void> initializeControllerFuture;
  bool isRecording = false;
  bool isFlashOn = false;
  bool isFrontCamera = true;
  double transform = 0.0;

  @override
  void onInit() {
    debugPrint('oninit in videoController called');
    super.onInit();
    debugPrint('cameras => $camerasContants');
    camController = CameraController(camerasContants[0], ResolutionPreset.high);
    initializeControllerFuture = camController.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    camController.dispose();
  }

  /// Returns a suitable camera icon for [direction].
  IconData getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return Icons.camera_rear;
      case CameraLensDirection.front:
        return Icons.camera_front;
      case CameraLensDirection.external:
        return Icons.camera;
      default:
        throw ArgumentError('Unknown lens direction');
    }
  }

  void takePhoto(BuildContext context) async {
    // final path =
    // join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    if (isRecording) return;
    final image = await camController.takePicture();
    Get.to(() => CameraViewPage(path: image.path));
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (builder) => CameraViewPage(path: image.path),
    //   ),
    // );
  }

  startVideo() async {
    await camController.startVideoRecording();
    isRecording = true;
  }

  stopVideo(BuildContext context) async {
    XFile video = await camController.stopVideoRecording();
    isRecording = false;
    Get.to(() => VideoViewPage(path: video.path));
  }

  handleFlash() {
    isFlashOn = !isFlashOn;
    isFlashOn
        ? camController.setFlashMode(FlashMode.torch)
        : camController.setFlashMode(FlashMode.off);
  }

  handleSwitchCamera() {
    isFrontCamera = !isFrontCamera;
    transform = transform + pi;
    int camPosition = isFrontCamera ? 0 : 1;
    camController =
        CameraController(camerasContants[camPosition], ResolutionPreset.high);
    initializeControllerFuture = camController.initialize();
  }
}

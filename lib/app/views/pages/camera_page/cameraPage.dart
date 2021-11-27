import 'package:flutter/material.dart';
import 'package:whats_app_clone/app/views/screens/camera_screen/cameraScreen.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return CameraScreen();
  }
}
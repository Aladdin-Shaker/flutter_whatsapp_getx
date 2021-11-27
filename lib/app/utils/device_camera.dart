import 'package:camera/camera.dart';
import 'package:whats_app_clone/app/config/constants.dart';

class MyDeviceCamear {
  Future<void> avCameras() async {
    camerasContants = await availableCameras();
    print('cameras in device camera class => $camerasContants');
  }
}

/* 
* TOP LEVEL CONTROLLER
* contains all things and function 
* that each controller in the application must excute it 
* and we extends from it with abstract to prevent any using for this class
*/

import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:whats_app_clone/root/contracts/rootModel.dart';

abstract class RootController extends GetxController
    with StateMixin<RootModel> {
  Map<String, dynamic> buildResponse(
      Map<String, dynamic>? data, bool status, bool alert, String message) {
    final Map<String, dynamic> result = {
      'status': status,
      'alert': alert ? 'Successful' : 'Error',
      'data': data ?? null,
      'message': message,
    };

    return result;
  }
}

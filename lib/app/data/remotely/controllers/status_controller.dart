import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:whats_app_clone/app/models/status.dart';
import 'package:whats_app_clone/app/services/status_service.dart';
import 'package:whats_app_clone/root/contracts/rootController.dart';

class StatusController extends RootController {
  // RxList<StatusModel> recentStatus = <StatusModel>[].obs;
  // RxList<StatusModel> viewedStatus = <StatusModel>[].obs;

  Rx<Future<List<StatusModel>>?> recentStatus =
      Future.value(<StatusModel>[]).obs;
  Rx<Future<List<StatusModel>>?> viewedStatus =
      Future.value(<StatusModel>[]).obs;
  // final loading = Rx<bool>(false);

  @override
  void onInit() {
    print('---- StatusController onInit called ----');
    super.onInit();
    // loading(true);
    getAllRecentStatus();
    getAllViewedStatus();
    // loading(false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<List<StatusModel>>? getAllRecentStatus() {
    try {
      recentStatus.value = StatusService().getRecentStatus();
    } catch (error) {
      return Future.error(error.toString());
    }
  }

  Future<List<StatusModel>>? getAllViewedStatus() {
    try {
      viewedStatus.value = StatusService().getViewedStatus();
    } catch (error) {
      return Future.error(error.toString());
    }
  }
}

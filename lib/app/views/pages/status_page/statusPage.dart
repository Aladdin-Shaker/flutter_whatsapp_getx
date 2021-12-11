import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:whats_app_clone/app/data/remotely/controllers/status_controller.dart';
import 'package:whats_app_clone/app/models/status.dart';
import 'package:whats_app_clone/app/views/widgets/statusDividerTitle.dart';
import 'package:whats_app_clone/app/views/widgets/statusListTile.dart';

class StatusPage extends GetView<StatusController> {
  StatusPage({Key? key}) : super(key: key);
  final controller = Get.put(StatusController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
      body: SafeArea(
        // child: GetX<StatusController>(
        //     init: StatusController(),
        //     // dispose: (state) => StatusController(),
        //     builder: (controller) {
        //       return SingleChildScrollView(
        //         child: Column(
        //           children: [
        //             StatusListTile(
        //               title: 'My Status',
        //               subTitle: 'Tap to add status update',
        //               imageUrl: 'assets/images/1.jpeg',
        //               isMe: true,
        //             ),
        //             StatusDividerTitle(title: 'Recent updates'),
        //             renderRecentStatus(controller),
        //             StatusDividerTitle(title: 'Viewed updates'),
        //             renderViewedStatus(controller),
        //           ],
        //         ),
        //       );
        //     }),
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                StatusListTile(
                  title: 'My Status',
                  subTitle: 'Tap to add status update',
                  imageUrl: 'assets/images/1.jpeg',
                  isMe: true,
                ),
                StatusDividerTitle(title: 'Recent updates'),
                renderRecentStatus(controller),
                StatusDividerTitle(title: 'Viewed updates'),
                renderViewedStatus(controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  renderViewedStatus(StatusController controller) {
    return FutureBuilder<List<StatusModel>>(
      future: controller.viewedStatus.value,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final StatusModel item = snapshot.data![index];
              return StatusListTile(
                title: item.name,
                subTitle: item.date,
                imageUrl: item.imageUrl,
                isMe: false,
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        // By default, show a loading spinner.
        return SizedBox(
          // height: SizeConfig.screenHeight / 1.2,
          child: const Center(
              // child: CircularProgressIndicator(),
              ),
        );
      },
    );
  }

  renderRecentStatus(StatusController controller) {
    return FutureBuilder<List<StatusModel>>(
      future: controller.recentStatus.value,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final StatusModel item = snapshot.data![index];
              return StatusListTile(
                title: item.name,
                subTitle: item.date,
                imageUrl: item.imageUrl,
                isMe: false,
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        // By default, show a loading spinner.
        return SizedBox(
          // height: SizeConfig.screenHeight / 2,
          child: const Center(
              // child: CircularProgressIndicator(),
              ),
        );
      },
    );
  }
}

import 'package:whats_app_clone/app/models/status.dart';
import 'package:whats_app_clone/root/contracts/rootService.dart';

class StatusService extends RootService {
  @override
  Future create({required Map<String, dynamic> data}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<List<StatusModel>>? findAll(
      {Map<String, dynamic>? filters, int? page}) async {
    throw UnimplementedError();
  }

  @override
  Future findOne({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future update({required model}) {
    throw UnimplementedError();
  }

  Future<List<StatusModel>>? getRecentStatus() async {
    return Future.delayed(Duration(seconds: 1), () {
      final List<StatusModel> statuses = [
        StatusModel(
          '1',
          'Ahmad khalid',
          '12:41',
          'assets/images/1.jpeg',
          1,
          false,
        ),
        StatusModel(
          '2',
          'Ahmad khalid',
          '09:25',
          'assets/images/2.jpeg',
          3,
          false,
        ),
        // StatusModel(
        //   '3',
        //   'Ahmad khalid',
        //   '12:41',
        //   'assets/images/3.jpeg',
        // ),
        // StatusModel(
        //   '4',
        //   'Ahmad khalid',
        //   '12:41',
        //   'assets/images/3.jpeg',
        // ),
        // StatusModel(
        //   '3',
        //   'Ahmad khalid',
        //   '12:41',
        //   'assets/images/3.jpeg',
        // ),
        // StatusModel(
        //   '4',
        //   'Ahmad khalid',
        //   '12:41',
        //   'assets/images/3.jpeg',
        // ),
        // StatusModel(
        //   '3',
        //   'Ahmad khalid',
        //   '12:41',
        //   'assets/images/3.jpeg',
        // ),
        // StatusModel(
        //   '4',
        //   'Ahmad khalid',
        //   '12:41',
        //   'assets/images/3.jpeg',
        // ),
        // StatusModel(
        //   '3',
        //   'Ahmad khalid',
        //   '12:41',
        //   'assets/images/3.jpeg',
        // ),
        // StatusModel(
        //   '4',
        //   'Ahmad khalid',
        //   '12:41',
        //   'assets/images/3.jpeg',
        // ),
      ];
      return statuses;
    });
  }

  Future<List<StatusModel>>? getViewedStatus() async {
    return Future.delayed(Duration(seconds: 1), () {
      final List<StatusModel> statuses = [
        StatusModel(
          '1',
          'Ahmad khalid',
          '12:41',
          'assets/images/1.jpeg',
          2,
          true,
        ),
        StatusModel(
          '2',
          'Ahmad khalid',
          '12:41',
          'assets/images/2.jpeg',
          5,
          true,
        ),
        StatusModel(
          '3',
          'Ahmad khalid',
          '12:41',
          'assets/images/3.jpeg',
          1,
          true,
        ),
        // StatusModel(
        //   '4',
        //   'Ahmad khalid',
        //   '12:41',
        //   'assets/images/3.jpeg',
        // ),
        // StatusModel(
        //   '3',
        //   'Ahmad khalid',
        //   '12:41',
        //   'assets/images/3.jpeg',
        // ),
        // StatusModel(
        //   '4',
        //   'Ahmad khalid',
        //   '12:41',
        //   'assets/images/3.jpeg',
        // ),
        // StatusModel(
        //   '3',
        //   'Ahmad khalid',
        //   '12:41',
        //   'assets/images/3.jpeg',
        // ),
        // StatusModel(
        //   '4',
        //   'Ahmad khalid',
        //   '12:41',
        //   'assets/images/3.jpeg',
        // ),
      ];

      return statuses;
    });
  }
}

/* 
* TOP LEVEL SERVICE
* contains all things and function 
* that each service in the application must excute it 
* and we extends from it with abstract to prevent any using for this class
* and the service can be (externel API or locally)
*/

import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

abstract class RootService<RootModel> extends GetxService {
  Future<RootModel?> create({required Map<String, dynamic> data});
  Future<RootModel?> update({required RootModel model});
  Future<bool> delete({required String id});
  Future<List<RootModel>>? findAll({Map<String, dynamic>? filters, int? page});
  Future<RootModel> findOne({required String id});
}

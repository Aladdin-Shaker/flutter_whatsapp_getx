import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:whats_app_clone/app/models/chat.dart';
import 'package:whats_app_clone/app/services/chat_service.dart';
import 'package:whats_app_clone/root/contracts/rootController.dart';

class ChatsController extends RootController {
  Rx<Future<List<ChatModel>>?> listChats = Future.value(<ChatModel>[]).obs;
  // var listChats = Future.value(<ChatModel>[]);
  // List<ChatModel> listChats = [];

  late TabController tabController;

  @override
  void onInit() {
    print('---- ChatsController onInit called ----');
    super.onInit();
    getAllChats();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<List<ChatModel>>? getAllChats() {
    try {
      listChats.value = ChatService().findAll();
    } catch (error) {
      print('error chat controoler => $error');
      return Future.error(error.toString());
    }
  }
}

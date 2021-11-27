import 'package:flutter/material.dart';
import 'package:whats_app_clone/root/contracts/rootController.dart';

class HomeController extends RootController {
  // int _selectedBottomBarIndex = 0;
  // int get getSelectedBottomBarIndex => _selectedBottomBarIndex;

  // Widget _currentPage = HomeScreen();
  // Widget get getCurrentPage => _currentPage;

  // void onSelectBottomBarItem(int index) {
  //   if (_selectedBottomBarIndex == index) {
  //     return;
  //   } else {
  //     _selectedBottomBarIndex = index;
  //     switch (index) {
  //       case 0:
  //         _currentPage = HomeScreen();
  //         break;
  //       case 1:
  //         _currentPage = const MessagesScreen();
  //         break;
  //       case 2:
  //         _currentPage = CartScreen();
  //         break;
  //       case 3:
  //         _currentPage = const AccountScreen();
  //         break;
  //       default:
  //     }
  //   }
  //   update();
  // }

  late TabController tabController;
}

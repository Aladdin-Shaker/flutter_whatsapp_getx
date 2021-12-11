import 'package:flutter/material.dart';
import 'package:whats_app_clone/app/config/sizes.dart';
import 'package:whats_app_clone/app/views/screens/home_screen/homeScreen.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ChatsScreen(),
    );
  }
}

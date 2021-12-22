import 'package:flutter/material.dart';
import 'package:whats_app_clone/app/config/constants.dart';
import 'package:whats_app_clone/app/config/sizes.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(25),
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Welcome to WhatsApp',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 25,
                  ),
                ),
                Spacer(flex: 1),
                Image.asset(
                  'assets/images/bg.png',
                  color: kPrimaryColor,
                  height: SizeConfig.screenHeight / 2,
                ),
                Spacer(flex: 1),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Agree And Continue To Accept The ',
                    style: TextStyle(color: Colors.grey),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'WhatsApp Terms Of Service And Privacy Policy',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: SizeConfig.screenWidth - 25,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 4,
                      primary: kSecondaryColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      'AGREE AND CONTINUE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

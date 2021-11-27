import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whats_app_clone/app/models/chat.dart';

class SelectedContact extends StatelessWidget {
  final ChatModel contact;
  const SelectedContact({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueGrey[200],
                radius: 20.0,
                child: SvgPicture.asset(
                  "assets/images/person_white_36dp.svg",
                  height: 25,
                  width: 25,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 10.0,
                  child: Icon(
                    Icons.close,
                    size: 12,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.grey,
                ),
              )
            ],
          ),
          SizedBox(height: 2),
          Text(
            this.contact.name.split(" ")[0],
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whats_app_clone/app/models/chat.dart';

class ContactCard extends StatelessWidget {
  final ChatModel chat;
  const ContactCard({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        child: Column(
          children: [
            ListTile(
              leading: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey[200],
                    radius: 20.0,
                    child: this.chat.isGroup
                        ? SvgPicture.asset(
                            "assets/images/groups_white_36dp.svg",
                            height: 35,
                            width: 35,
                          )
                        : SvgPicture.asset(
                            "assets/images/person_white_36dp.svg",
                            height: 35,
                            width: 35,
                          ),
                  ),
                  chat.isSelected
                      ? Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 10.0,
                            child: Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.white,
                            ),
                            backgroundColor: Color(0xFF128C7E),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
              title: Text(
                this.chat.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.done_all,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Text(this.chat.status),
                ],
              ),
            ),
            Divider(thickness: 0.5)
          ],
        ),
      ),
    );
  }
}

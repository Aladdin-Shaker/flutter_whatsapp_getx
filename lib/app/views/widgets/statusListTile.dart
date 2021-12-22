import 'package:flutter/material.dart';
import 'package:whats_app_clone/app/config/constants.dart';
import 'package:whats_app_clone/app/views/pages/status_page/custom_paint_status.dart';

class StatusListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageUrl;
  final bool isMe;
  final bool isViewed;
  final int statusNo;
  const StatusListTile({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.isMe,
    required this.isViewed,
    required this.statusNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CustomPaint(
          painter: CustomPaintStatus(isViewed, statusNo),
          child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: kPrimaryColor,
                radius: 25.0,
                child: Image.asset(
                  this.imageUrl,
                  height: 35,
                  fit: BoxFit.cover,
                  width: 35,
                ),
              ),
              isMe
                  ? Positioned(
                      bottom: 0,
                      right: 2,
                      child: CircleAvatar(
                        backgroundColor: Colors.greenAccent[700],
                        radius: 10.0,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
        title: Text(
          this.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          children: [
            Text(this.subTitle),
          ],
        ),
      ),
    );
  }
}

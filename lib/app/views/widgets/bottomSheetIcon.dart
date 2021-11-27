import 'package:flutter/material.dart';

class BottomSheetIcon extends StatelessWidget {
  final Color color;
  final String text;
  final Icon icon;

  const BottomSheetIcon({
    required this.color,
    required this.text,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: color,
          child: IconButton(
            icon: icon,
            color: Colors.white,
            onPressed: () {},
          ),
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
          ),
        )
      ],
    );
  }
}

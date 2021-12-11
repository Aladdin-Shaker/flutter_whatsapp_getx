import 'package:flutter/material.dart';

class StatusDividerTitle extends StatelessWidget {
  final String title;
  const StatusDividerTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Text(
        this.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

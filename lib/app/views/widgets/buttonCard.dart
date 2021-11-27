import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  final IconData icon;
  final String title;
  const ButtonCard({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFF25D366),
              radius: 25.0,
              child: Icon(
                icon,
                size: 25,
                color: Colors.white,
              ),
            ),
            title: Text(
              this.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(thickness: 0.5)
        ],
      ),
    );
  }
}

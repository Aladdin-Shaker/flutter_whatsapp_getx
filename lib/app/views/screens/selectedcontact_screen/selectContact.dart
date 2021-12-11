import 'package:flutter/material.dart';
import 'package:whats_app_clone/app/models/chat.dart';
import 'package:whats_app_clone/app/views/screens/newGroup_screen/newGroup.dart';
import 'package:whats_app_clone/app/views/widgets/buttonCard.dart';
import 'package:whats_app_clone/app/views/widgets/contactCard.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<ChatModel> contacts = [
    ChatModel.fromJson({
      'id': '1',
      'name': 'Ahmad Nour',
      'date': '',
      'icon': 'person.svg',
      'currentMessage': '',
      'isGroup': false,
      'status': 'status here ...',
    }),
    ChatModel.fromJson({
      'id': '2',
      'name': 'Mohammed Salim',
      'date': '',
      'icon': 'person.svg',
      'currentMessage': '',
      'isGroup': false,
      'status': 'status here ...',
    }),
    ChatModel.fromJson({
      'id': '3',
      'name': 'Ayham Madi',
      'date': '',
      'icon': 'person.svg',
      'currentMessage': '',
      'isGroup': false,
      'status': 'status here ...',
    }),
    ChatModel.fromJson({
      'id': '4',
      'name': 'Abdallah frah',
      'date': '',
      'icon': 'person.svg',
      'currentMessage': '',
      'isGroup': false,
      'status': 'status here ...',
    }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        titleSpacing: 0,
        backgroundColor: Theme.of(context).primaryColor,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Select Contact',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(
              '256 contacts',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Invite a friend'),
                  value: 'Invite a friend',
                  enabled: true,
                ),
                PopupMenuItem(
                  child: Text('Contacts'),
                  value: 'Contacts',
                  enabled: true,
                ),
                PopupMenuItem(
                  child: Text('Refresh'),
                  value: 'Refresh',
                  enabled: true,
                ),
                PopupMenuItem(
                  child: Text('Help'),
                  value: 'Help',
                  enabled: true,
                ),
              ];
            },
            tooltip: 'Menu',
            icon: Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              debugPrint('111');
              return InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => NewGroup(),
                        ),
                      ),
                  child: ButtonCard(icon: Icons.group, title: 'New group'));
            }
            if (index == 1) {
              return ButtonCard(icon: Icons.person_add, title: 'New contact');
            }
            return ContactCard(chat: contacts[index - 2]);
          },
        ),
      ),
    );
  }
}

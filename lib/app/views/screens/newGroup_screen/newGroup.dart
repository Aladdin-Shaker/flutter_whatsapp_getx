import 'package:flutter/material.dart';
import 'package:whats_app_clone/app/models/chat.dart';
import 'package:whats_app_clone/app/views/widgets/contactCard.dart';
import 'package:whats_app_clone/app/views/widgets/selectedContact.dart';

class NewGroup extends StatefulWidget {
  const NewGroup({Key? key}) : super(key: key);

  @override
  _NewGroupState createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  List<ChatModel> contacts = [
    ChatModel.fromJson({
      'id': '1',
      'name': 'Ahmad Nour',
      'date': '',
      'icon': 'person.svg',
      'currentMessage': '',
      'isGroup': false,
      'status': 'status here ...',
      'isSelected': false,
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
      'isSelected': false,
    }),
    ChatModel.fromJson({
      'id': '4',
      'name': 'Abdallah frah',
      'date': '',
      'icon': 'person.svg',
      'currentMessage': '',
      'isGroup': false,
      'status': 'status here ...',
      'isSelected': false,
    }),
  ];

  List<ChatModel> selectedContacts = [];

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
              'New Group',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(
              'Add Participants',
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
        ],
      ),
      body: Stack(
        children: [
          Container(
            margin: selectedContacts.length > 0
                ? EdgeInsets.only(top: MediaQuery.of(context).size.height / 10)
                : EdgeInsets.only(top: 10),
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (contacts[index].isSelected == false) {
                      setState(() {
                        contacts[index].isSelected = true;
                        this.selectedContacts.add(contacts[index]);
                      });
                    } else {
                      setState(() {
                        contacts[index].isSelected = false;
                        this.selectedContacts.remove(contacts[index]);
                      });
                    }
                  },
                  child: ContactCard(
                    chat: contacts[index],
                  ),
                );
              },
            ),
          ),
          selectedContacts.length > 0
              ? Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 10,
                      color: Colors.white,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          if (contacts[index].isSelected == true) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    contacts[index].isSelected = false;
                                    this
                                        .selectedContacts
                                        .remove(contacts[index]);
                                  });
                                },
                                child:
                                    SelectedContact(contact: contacts[index]));
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                  ],
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

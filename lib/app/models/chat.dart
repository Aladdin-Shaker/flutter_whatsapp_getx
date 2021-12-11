import 'package:whats_app_clone/root/contracts/rootModel.dart';

class ChatModel extends RootModel {
  final String id;
  final String name;
  final String date;
  final String icon;
  final bool isGroup;
  final String status;
  final String currentMessage;
  bool isSelected = false;

  ChatModel(this.id, this.name, this.date, this.icon, this.isGroup, this.status,
      this.currentMessage);

  @override
  ChatModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        date = json['date'] as String,
        icon = json['icon'] as String,
        isGroup = json['isGroup'],
        status = json['status'] as String,
        currentMessage = json['currentMessage'] as String,
        isSelected = json['isSelected'] as bool,
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'date': date,
        'icon': icon,
        'isGroup': isGroup,
        'status': status,
        'currentMessage': currentMessage,
        'isSelected': isSelected,
      };
}

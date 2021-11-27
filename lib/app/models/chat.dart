class ChatModel {
  final String id;
  final String name;
  final String date;
  final String icon;
  final bool isGroup;
  final String status;
  final String currentMessage;
  bool isSelected = false;

  ChatModel({
    required this.id,
    required this.name,
    required this.date,
    required this.icon,
    required this.isGroup,
    required this.status,
    required this.currentMessage,
    this.isSelected = false,
  });
}

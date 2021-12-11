import 'package:whats_app_clone/root/contracts/rootModel.dart';

class MessageModel extends RootModel {
  final String message;
  final String type; // target, source
  final String time;

  MessageModel(this.message, this.type, this.time);

  @override
  MessageModel.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        type = json['type'],
        time = json['time'],
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        'message': message,
        'type': type,
        'time': time,
      };
}

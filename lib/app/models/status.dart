import 'package:whats_app_clone/root/contracts/rootModel.dart';

class StatusModel extends RootModel {
  final String id;
  final String name;
  final String date;
  final String imageUrl;
  bool isViewed = false;

  StatusModel(this.id, this.name, this.date, this.imageUrl);

  @override
  StatusModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        date = json['date'] as String,
        imageUrl = json['imageUrl'] as String,
        isViewed = json['isViewed'] as bool,
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'date': date,
        'imageUrl': imageUrl,
        'isViewed': isViewed,
      };
}

import 'package:whats_app_clone/root/contracts/rootModel.dart';

class StatusModel extends RootModel {
  final String id;
  final String name;
  final String date;
  final String imageUrl;
  int statusNo = 1;
  bool isViewed = false;

  StatusModel(
    this.id,
    this.name,
    this.date,
    this.imageUrl,
    this.statusNo,
    this.isViewed,
  );

  @override
  StatusModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        date = json['date'] as String,
        imageUrl = json['imageUrl'] as String,
        statusNo = json['statusNo'],
        isViewed = json['isViewed'],
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'date': date,
        'imageUrl': imageUrl,
        'statusNo': statusNo,
        'isViewed': isViewed,
      };
}

import 'package:whats_app_clone/root/contracts/rootModel.dart';

class User extends RootModel {
  final int id;
  // final String? email;
  // final int? phone;
  // final String? firstname;
  // final String? lastname;
  final String fullname;
  // final String? fcmToken;
  // final String? imageUrlId;
  // final int? status;
  // final String? gender;
  // final String? bio;
  // final String? description;
  // final String? country;
  // final String? city;
  // final String? address;
  // final String? facebook;
  // final String? instagram;
  // final String? twitter;
  final String imageUrl;

  @override
  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        fullname = json['fullname'] as String,
        imageUrl = json['imageUrl'] as String,
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'fullname': fullname,
        'imageUrl': imageUrl,
      };
}

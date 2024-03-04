import '../../../../core/constants/constants.dart';

class UserModel {
  final String name;
  final String email;
  final String uId;
  final String bio;
  final String image;

  UserModel({
    required this.name,
    required this.email,
    required this.uId,
    required this.bio,
    required this.image,
  });

  factory UserModel.fromJson({required Map<String, dynamic> json}) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
      bio: json['bio'],
      image: json['image'] == '' ? Constants.defaultImage : json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'uId': uId,
        'bio': bio,
        'image': image,
      };
}

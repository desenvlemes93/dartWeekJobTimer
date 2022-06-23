import 'package:jobtimer/app/entities/User/user.dart';

class UserModel {
  String email;
  String displayName;
  String imgAvatar;
  UserModel({
    required this.email,
    required this.displayName,
    required this.imgAvatar,
  });

  factory UserModel.fromEntity(User user) {
    return UserModel(
      email: user.email,
      displayName: user.displayName,
      imgAvatar: user.imgAvatar,
    );
  }
}

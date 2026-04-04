import 'package:image_picker/image_picker.dart';

class ProfileModel {
  final String userName;
  final String userEmail;
  final String? profilePic;
  XFile? newProfileImage;

  ProfileModel({
    required this.userName,
    required this.userEmail,
    required this.profilePic,
    this.newProfileImage,
  });

  // CopyWith method
  ProfileModel copyWith({
    String? userName,
    String? userEmail,
    String? profilePic,
    XFile? newProfileImage,
  }) {
    return ProfileModel(
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      profilePic: profilePic ?? this.profilePic,
      newProfileImage: newProfileImage,
    );
  }
}

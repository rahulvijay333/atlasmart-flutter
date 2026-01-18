import 'dart:io';

class ProfileModel {
  final String userName;
  final String userEmail;
  final String? profilePic;
  File? newProfileImage;

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
    File? newProfileImage,
  }) {
    return ProfileModel(
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      profilePic: profilePic ?? this.profilePic,
      newProfileImage: newProfileImage,
    );
  }
}

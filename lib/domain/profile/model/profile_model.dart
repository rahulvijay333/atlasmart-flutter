class ProfileModel {
  final String userName;
  final String userEmail;
  final String? profilePic;

  ProfileModel({
    required this.userName,
    required this.userEmail,
    required this.profilePic,
  });

  // CopyWith method
  ProfileModel copyWith({
    String? userName,
    String? userEmail,
    String? profilePic,
  }) {
    return ProfileModel(
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      profilePic: profilePic ?? this.profilePic,
    );
  }
}
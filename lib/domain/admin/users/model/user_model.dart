class UserModel {
  final String userName;
  final String userEmail;
  String? userRole;
  DateTime? joinedDate;
  String? userImage;
  bool? userActiveStatus;

  UserModel({
    required this.userName,
    required this.userEmail,
    required this.joinedDate,
    this.userImage,
  });
}

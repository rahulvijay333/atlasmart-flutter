class UserModel {
  final String userName;
  final String userEmail;
  String? userRole;
  DateTime? joinedDate;
  String? userImage;
  bool? userActiveStatus;
  int? id;

  UserModel({
    required this.userName,
    required this.userEmail,
    required this.joinedDate,
    this.userImage,
    this.id
  });
}

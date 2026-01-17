class AdminUserModel {
  final String userName;
  final String userEmail;
  String? userRole;
  DateTime? joinedDate;
  String? userImage;
  bool? userActiveStatus;

  AdminUserModel({
    required this.userName,
    required this.userEmail,
    required this.joinedDate,
  });
}

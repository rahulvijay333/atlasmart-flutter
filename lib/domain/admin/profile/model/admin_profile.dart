// class AdminUserModel {
//   final String userName;
//   final String userEmail;
//   String? userRole;
//   DateTime? joinedDate;
//   String? userImage;
//   bool? userActiveStatus;
//   String? password;

//   AdminUserModel({
//     required this.userName,
//     required this.userEmail,
//     required this.joinedDate,
//   });
// }

import 'dart:io';

class AdminUserModel {
  final String userName;
  final String userEmail;
  String? userRole;
  DateTime? joinedDate;
  String? userImage;
  bool? userActiveStatus;
  String? password;
  File? newProfileImage;
  String? id;

  AdminUserModel({
    required this.userName,
    required this.userEmail,
    required this.joinedDate,
  });

  AdminUserModel copyWith({
    String? userName,
    String? userEmail,
    String? userRole,
    DateTime? joinedDate,
    String? userImage,
    bool? userActiveStatus,
    String? password,
    File? newProfileImage,
    String? id
  }) {
    final model = AdminUserModel(
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      joinedDate: joinedDate ?? this.joinedDate,
    );

    model.userRole = userRole ?? this.userRole;
    model.userImage = userImage ?? this.userImage;
    model.userActiveStatus = userActiveStatus ?? this.userActiveStatus;
    model.password = password ?? this.password;
    model.newProfileImage = newProfileImage;
    model.id =id;

    return model;
  }
}

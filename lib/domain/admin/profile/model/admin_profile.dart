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

import 'package:image_picker/image_picker.dart';

class AdminUserModel {
  final String userName;
  final String userEmail;
  String? userRole;
  DateTime? joinedDate;
  String? userImage;
  bool? userActiveStatus;
  String? password;
  XFile? newProfileImage;
  String? id;
  String? brandName;
  String? companyName;

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
    XFile? newProfileImage,
    String? id,
    String? companyName,
    String? brandName,
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
    model.id = id;
    model.brandName = brandName;
    model.companyName = companyName;

    return model;
  }
}

import 'package:atlasmart/domain/core/constants/font.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/admin/users/model/user_model.dart';

class ScreenUserDetails extends StatelessWidget {
  const ScreenUserDetails(this.user, {super.key});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(title: Text('User Details')),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            Center(
              child: CircleAvatar(
                maxRadius: 50,
                backgroundImage: user.userImage?.isNotEmpty == true
                    ? NetworkImage(user.userImage!)
                    : null,
                child: user.userImage?.isEmpty == true
                    ? Icon(Icons.person)
                    : null,
              ),
            ),
            Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                keyValueRowWidget(
                  size: size,
                  keyName: 'Name',
                  value: user.userName,
                ),
                keyValueRowWidget(
                  size: size,
                  keyName: 'Email',
                  value: user.userEmail,
                ),
                if (user.joinedDate != null)
                  keyValueRowWidget(
                    size: size,
                    keyName: 'Account Created',
                    value: DateFormat(
                      'dd MMM yyy hh:mm a',
                    ).format(user.joinedDate!.toLocal()),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class keyValueRowWidget extends StatelessWidget {
  const keyValueRowWidget({
    super.key,
    required this.size,
    required this.keyName,
    required this.value,
  });

  final Size size;
  final String keyName;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: size.width * 0.155,
          child: Text(
            keyName,
            style: AppFont.title14Style.copyWith(fontWeight: FontWeight.bold),
          ),
        ),

        Text(value),
      ],
    );
  }
}

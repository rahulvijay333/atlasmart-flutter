import 'package:atlasmart/presentation/common/button_widget.dart';
import 'package:atlasmart/presentation/common/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/admin/manage_admin_notification/manage_admin_notification_bloc.dart';
import '../../../domain/core/constants/strings.dart';

class ScreenPushNotifications extends StatefulWidget {
  const ScreenPushNotifications({super.key});

  @override
  State<ScreenPushNotifications> createState() =>
      _ScreenPushNotificationsState();
}

class _ScreenPushNotificationsState extends State<ScreenPushNotifications> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  void _sendNotification() {
    if (_titleController.text.isEmpty || _bodyController.text.isEmpty) {
      AppSnackBar.show(context, 'Please fill all fields');
      return;
    }

    BlocProvider.of<ManageAdminNotificationBloc>(context).add(
      SendPushNotificationEvent(
        title: _titleController.text.trim(),
        body: _bodyController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Send Notification",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Title Field
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: "Title",
                  hintText: "Enter notification title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Message Field
              TextFormField(
                controller: _bodyController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Message",
                  hintText: "Enter message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Send Button
              // SizedBox(
              //   width: double.infinity,
              //   height: 50,
              //   child: ElevatedButton.icon(
              //     onPressed: _sendNotification,
              //     icon: const Icon(Icons.send),
              //     label: const Text("Send Notification"),
              //     style: ElevatedButton.styleFrom(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //     ),
              //   ),
              // ),
              BlocConsumer<
                ManageAdminNotificationBloc,
                ManageAdminNotificationState
              >(
                listener: (context, state) {
                  if (state.error != null && state.error!.isNotEmpty) {
                    AppSnackBar.show(context, state.error!);
                  }

                  if (state.status == true) {
                    _titleController.clear();
                    _bodyController.clear();
                    AppSnackBar.show(context, 'Send Successfully');
                  }
                },
                builder: (context, state) {
                  return ButtonWidget(
                    isloading: state.isloading,
                    title: 'Send Push Notification',
                    height: 50,
                    ontap: () {
                      if (state.isloading == false) {
                        _sendNotification();
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

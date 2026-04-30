import 'package:atlasmart/domain/core/constants/font.dart';
import 'package:atlasmart/domain/core/util/data_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/customer/notification/notification_bloc.dart';
import '../../../domain/customer/notifications/model/notification_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationBloc>().add(GetAllNotificationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text("Notifications", style: AppFont.appBar18Style),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, state) {
              if (state.isloading) {
                return const Center(child: CircularProgressIndicator());
              }
          
              if (state.error != null) {
                return Center(
                  child: Column(
                    children: [
                      Text(state.error!, style: const TextStyle(color: Colors.red)),
                      IconButton(
                        onPressed: () {
                          context.read<NotificationBloc>().add(
                            GetAllNotificationsEvent(),
                          );
                        },
                        icon: Icon(Icons.refresh),
                      ),
                    ],
                  ),
                );
              }
          
              if (state.notificationList.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      Text("No notifications yet"),
                      IconButton(
                        onPressed: () {
                          context.read<NotificationBloc>().add(
                            GetAllNotificationsEvent(),
                          );
                        },
                        icon: Icon(Icons.refresh),
                      ),
                    ],
                  ),
                );
              }
          
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<NotificationBloc>().add(GetAllNotificationsEvent());
                },
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: state.notificationList.length,
                  itemBuilder: (context, index) {
                    final notification = state.notificationList[index];
          
                    return GestureDetector(
                      onTap: () {
                        if (notification.navigateTo != null) {
                          Navigator.pushNamed(
                            context,
                            notification.navigateTo!,
                            arguments: notification.parameter,
                          );
                        }
                      },
                      child: _notificationCard(notification),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// =======================
  /// CARD UI
  /// =======================
  Widget _notificationCard(NotificationModel notification) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ICON
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _getTypeColor(notification.type).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getTypeIcon(notification.type),
              color: _getTypeColor(notification.type),
            ),
          ),

          const SizedBox(width: 12),

          /// CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notification.description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(),
                    Text(
                      CustomDateFormat.ddmmmyyyWithTime(notification.date),
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ICON LOGIC
  IconData _getTypeIcon(String type) {
    switch (type) {
      case "order_status":
        return Icons.shopping_bag;
      case "promotion":
        return Icons.local_offer;
      case "alert":
        return Icons.warning;
      default:
        return Icons.notifications;
    }
  }

  /// COLOR LOGIC
  Color _getTypeColor(String type) {
    switch (type) {
      case "order_status":
        return Colors.blue;
      case "promotion":
        return Colors.amber;
      case "alert":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

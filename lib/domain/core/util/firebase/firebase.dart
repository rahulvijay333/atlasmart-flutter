import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/customer/order_details/order_details_bloc.dart';
import '../../../../presentation/common/widgets/app_notification_banner.dart';
import '../../../../presentation/customer/orders/screen_order_details.dart';
import '../navigator_key.dart';

@pragma('vm:entry-point')
class FirebaseNotificationService {
  String? _fctoken;
  RemoteMessage? _initialMessage;

  FirebaseNotificationService._privateConstructor();
  static final FirebaseNotificationService instance =
      FirebaseNotificationService._privateConstructor();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  /// 🔹 Initialize everything
  Future<void> init() async {
    await _requestPermission();
    await _initToken();
    _setupForegroundHandler();
    _setupBackgroundHandler();
  }

  /// 🔹 Request permission (Android 13+)
  Future<void> _requestPermission() async {
    NotificationSettings settings = await _messaging.requestPermission();

    log('User permission: ${settings.authorizationStatus}');
  }

  /// 🔹 Get FCM token
  Future<void> _initToken() async {
    String? token = await _messaging.getToken();
    _fctoken = token;
    log("FCM Token: $token");
  }

  String? get ftoken => _fctoken;

  /// 🔹 Foreground messages
  void _setupForegroundHandler() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("Full message: ${message.toMap()}");

      if (message.notification != null) {
        AppNotificationBanner.show(
          title: message.notification?.title ?? "Notification",
          body: message.notification?.body ?? "",
          onTap: () => _handleNavigation(message),
        );
      }
    });
  }

  /// 🔹 Handle navigation based on message data
  void _handleNavigation(RemoteMessage message) async {
    final screen = message.data['navigateTo'];
    final orderId = message.data['orderId'];

    // 🕒 Safety: Wait for the navigator to be ready if the app is just starting
    // int retryCount = 0;
    // while (navigatorKey.currentContext == null && retryCount < 10) {
    //   log("Navigator not ready yet, retrying in 500ms... ($retryCount)");
    //   await Future.delayed(const Duration(milliseconds: 500));
    //   retryCount++;
    // }

    final context = navigatorKey.currentContext;
    if (context == null) {
      log("Navigation failed: Navigator context is still null after retries.");
      return;
    }

    switch (screen) {
      case 'order_details':
        // Check if we are already on the order_details screen to prevent duplicates
        bool isAlreadyOnOrderDetails = false;
        navigatorKey.currentState?.popUntil((route) {
          if (route.settings.name == 'order_details') {
            isAlreadyOnOrderDetails = true;
          }
          return true; // We don't actually want to pop anything
        });

        if (isAlreadyOnOrderDetails) {
          // If already there, just refresh the data via Bloc

          context.read<OrderDetailsBloc>().add(
            OrderDetailsEvent.getOrderDetails(orderId),
          );
        } else {
          // If not there, push the new screen with the name tag
          Navigator.of(context).push(
            MaterialPageRoute(
              settings: const RouteSettings(name: 'order_details'),
              builder: (context) => ScreenOrderDetails(orderId: orderId ?? ''),
            ),
          );
        }
        break;

      case 'home':
        // Handle other screens if needed
        break;
    }
  }

  /// 🔹 Background handler setup
  void _setupBackgroundHandler() {
    FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);
  }

  /// 🔹 Listen when app opened from notification
  void handleNotificationClick() async {
    // 1. When the app is in background but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log("Notification clicked (from background)!");
      _handleNavigation(message);
    });

    // 2. When the app is opened from a terminated state
    _initialMessage = await _messaging.getInitialMessage();
    if (_initialMessage != null) {
      log("Initial message stored for later processing.");
    }
  }

  /// 🔹 Process the initial message (to be called when UI is ready)
  void processInitialMessage() {
    if (_initialMessage != null) {
      log("Processing stored initial message...");
      _handleNavigation(_initialMessage!);
      _initialMessage = null; // Clear it so it doesn't fire again
    }
  }
}

/// 🔹 Top-level background handler (outside class for Native access)
@pragma('vm:entry-point')
Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log("Background message: ${message.messageId}");
}

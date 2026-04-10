import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class FirebaseNotificationService {
  String? _fctoken;

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
      log("Foreground message: ${message.notification?.title}");

     
    });
  }

  /// 🔹 Background handler setup
  void _setupBackgroundHandler() {
    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
  }

  /// 🔹 Static background handler
  static Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    log("Background message: ${message.messageId}");
  }

  /// 🔹 Listen when app opened from notification
  void handleNotificationClick() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log("Notification clicked!");
      // TODO: Navigate based on message.data
    });
  }
}

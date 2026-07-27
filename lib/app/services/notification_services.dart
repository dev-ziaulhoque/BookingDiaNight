import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// ─── 1. Top-Level Background Handler (For handling messages when the app is terminated/background) ───
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  // --- 🖨️ Print Push Notification Data (Background/Terminated) ---
  debugPrint('🔔 [BACKGROUND PUSH NOTIFICATION RECEIVED] 🔔');
  debugPrint('Message ID: ${message.messageId}');
  debugPrint('Title: ${message.notification?.title}');
  debugPrint('Body: ${message.notification?.body}');
  debugPrint('Payload/Data: ${message.data}');
  debugPrint('──────────────────────────────────────────');
}

class NotificationService {
  // Singleton Pattern
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // High Importance Channel for Android
  final AndroidNotificationChannel _channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.', // description
    importance: Importance.max,
    playSound: true,
  );

  Future<void> initNotification() async {
    // ─── 2. Request Permissions (For iOS & Android 13+) ───
    await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    // Request local notification permissions specifically for Android 13+
    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
    _localNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await androidImplementation?.requestNotificationsPermission();

    // ─── 3. Local Notification Initialization ───
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    // Initialize using Named Arguments (v22.0.0 syntax)
    await _localNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Triggered when a local notification is tapped in the foreground
        if (response.payload != null) {
          _handleNotificationClick(jsonDecode(response.payload!));
        }
      },
    );

    // Create the notification channel (Android only)
    await androidImplementation?.createNotificationChannel(_channel);

    // Set the Firebase background message handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // ─── 4. Setup FCM Listeners ───
    _setupFCMListeners();
  }

  void _setupFCMListeners() {
    // A. When the app is open (Foreground)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {

      // --- 🖨️ Print Push Notification Data (Foreground) ---
      debugPrint('🔔 [FOREGROUND PUSH NOTIFICATION RECEIVED] 🔔');
      debugPrint('Title: ${message.notification?.title}');
      debugPrint('Body: ${message.notification?.body}');
      debugPrint('Payload/Data: ${message.data}');
      debugPrint('──────────────────────────────────────────');

      if (message.notification != null) {
        _showLocalNotification(message);
      }
    });

    // B. When the app is in the background and the user taps on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('👉 Notification Clicked (App was in Background)!');
      _handleNotificationClick(message.data);
    });

    // C. When the app is completely terminated and opened via a notification tap
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        debugPrint('👉 Notification Clicked (App was Terminated)!');
        Future.delayed(const Duration(milliseconds: 1500), () {
          _handleNotificationClick(message.data);
        });
      }
    });
  }

  // Method to show local notification when the app is in the foreground
  Future<void> _showLocalNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null && !kIsWeb) {
      // Show using Named Arguments (v22.0.0 syntax)
      await _localNotificationsPlugin.show(
        id: notification.hashCode,
        title: notification.title,
        body: notification.body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            _channel.id,
            _channel.name,
            channelDescription: _channel.description,
            icon: '@mipmap/ic_launcher',
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: jsonEncode(message.data),
      );
    }
  }

  // Handle routing when a notification is clicked
  void _handleNotificationClick(Map<String, dynamic> data) {
    debugPrint("Routing Payload Data: $data");

    if (data.containsKey('type') || data.containsKey('eventId')) {
      final String type = data['type'] ?? '';
      final String eventId = data['eventId'] ?? '';

      // Routing logic using GetX (Customize based on your needs)
      if (type == 'event_details' && eventId.isNotEmpty) {
        debugPrint("Navigating to Event Details: $eventId");
        // Example: Get.toNamed(Routes.EVENT_DETAILS, arguments: {'id': eventId});
      }
    }
  }

  // Fetch FCM Device Token (Useful for sending to your backend)
  Future<String?> getDeviceToken() async {
    try {
      String? token = await _fcm.getToken();
      debugPrint("📱 FCM Device Token: $token");
      return token;
    } catch (e) {
      debugPrint("❌ Error getting FCM token: $e");
      return null;
    }
  }
}
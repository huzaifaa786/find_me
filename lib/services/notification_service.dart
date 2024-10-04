import 'dart:async';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationService extends GetxController with WidgetsBindingObserver {
  late final FirebaseMessaging _messaging;
  static NotificationService instance = Get.find();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  bool _isInForeground = true; // Tracks whether the app is in foreground

  @override
  void onInit() {
    WidgetsFlutterBinding.ensureInitialized();
    registerNotification();
    checkForInitialMessage();
    WidgetsBinding.instance.addObserver(this); // Observe app lifecycle changes
    super.onInit();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _isInForeground = state == AppLifecycleState.resumed;
  }

  void registerNotification() async {
    _messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@drawable/ic_launcher');

      final DarwinInitializationSettings initializationSettingsIOS =
          DarwinInitializationSettings();

      final InitializationSettings initializationSettings =
          InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );

      await flutterLocalNotificationsPlugin.initialize(initializationSettings);

      FirebaseMessaging.onMessage.listen(showFlutterNotification);
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void showFlutterNotification(RemoteMessage message) {
    

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
            log("DAAAAAAAAATA:${message.data.toString()}");

    if (notification != null && !_isInForeground && !kIsWeb) {
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails('your channel id', 'your channel name',
              importance: Importance.max,
              priority: Priority.high,
              ticker: 'ticker',
              fullScreenIntent: true,
              showWhen: false);

      const DarwinNotificationDetails iOSPlatformChannelSpecifics =
          DarwinNotificationDetails();

      const NotificationDetails platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: iOSPlatformChannelSpecifics);

      flutterLocalNotificationsPlugin.show(
          0, notification.title, notification.body, platformChannelSpecifics,
          payload: message.data.toString());
    }
  }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {}

  Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    FirebaseMessaging.onMessageOpenedApp.listen(showFlutterNotification);
  }

  checkForInitialMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      showFlutterNotification(initialMessage);
    }
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this); // Remove observer when done
    super.onClose();
  }
}

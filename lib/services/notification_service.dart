import 'dart:async';
import 'dart:developer';
import 'package:find_me/api/request_api/request_api.dart';
import 'package:find_me/components/popups/profile_request_popup.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessageOpenedApp);
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
    log("DAAAAAAAAATA:${message.data}");

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

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

  // DATA Handling

  void handleMessageOpenedApp(RemoteMessage message) {
    print("Notification clicked with data: ${message.data}");
    GetStorage box = GetStorage();

    String? apiToken = box.read('api_token');
    if(apiToken != null){
      _handleNotificationData(message.data);
    }
  }

  void _handleNotificationData(Map<String, dynamic> data) {
    if (data.isNotEmpty) {
      // Decode data if necessary
      String? type = data['type'];

      if (type == 'my-event') {
        // Extract additional fields as necessary
        String? requestType = data['request_type'];
        String? userName = data['user_name'];
        String? userImage = data['user_image'];
        String requestId = data['request_id'];

        if (requestType != null) {
          showPopup(userName, userImage, requestType, requestId);
        }
      } else if (type == 'emoji-gifted') {
        // Show emoji pop-up
        if (Get.isDialogOpen != true) {
          UiUtilites.EmojiGiftPopUp(Get.context,
              text: data['message'] ?? "",
              imageUrl: data['emoji_image'],
              senderImage: data['sender_image'],
              senderName: data['sender_name']);
        }
      }
    }
  }

  respondRequest(String id, String status) async {
    var response =
        await RequestApi.respondRequest(id: int.parse(id), status: status);

    if (response.isNotEmpty) {
      if (status == "accepted") {
        FirebaseAnalytics.instance.logEvent(
          name: 'accepted_profile_request',
        );
      } else {
        FirebaseAnalytics.instance.logEvent(
          name: 'rejected_profile_request',
        );
      }
    }
  }

  void showPopup(String? userName, String? userImage, String requestType,
      String requestId) {
    if (Get.isDialogOpen != true) {
      Get.dialog(
        barrierDismissible: false,
        ProfileRequestPopup(
          name: userName ?? "",
          imageUrl: userImage ??
              'https://avatar.iran.liara.run/public/boy?username=${userName ?? ""}',
          requestMessage: requestType == "profile"
              ? 'Would like to view your profile.'.tr
              : 'Would like to view your social media  \n accounts and business card.'
                  .tr,
          onAcceptTap: () {
            respondRequest(requestId, "accepted".tr);
            Get.back();
          },
          onRejectTap: () {
            respondRequest(requestId, "rejected".tr);
            Get.back();
          },
        ),
      );
    }
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this); // Remove observer when done
    super.onClose();
  }
}

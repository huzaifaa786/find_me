import 'package:find_me/app/auth/components/auth_appbar.dart';
import 'package:find_me/app/notifications/notifications_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      builder: (controller) => Scaffold(
        appBar: topBar(name: 'Sign Up'),
      ),
    );
  }
}

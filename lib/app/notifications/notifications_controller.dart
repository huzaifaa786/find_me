

import 'package:find_me/api/notifications/get_notifications_api.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:developer';


class NotificationsController extends GetxController {
  static NotificationsController instanse = Get.find();
  final bool status = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    notifications();
  }

  notifications() async {
    var response = await GetNotificationsApi.getNotifications();
     log('$response'); 
    if (response.isNotEmpty) {
      GetStorage box = GetStorage();
      box.read("api_token");
    }
  }
}

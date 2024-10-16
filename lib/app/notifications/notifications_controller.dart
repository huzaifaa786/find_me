import 'package:find_me/api/notifications/get_notifications_api.dart';
import 'package:find_me/models/notification_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:developer';

class NotificationsController extends GetxController {
  static NotificationsController instanse = Get.find();
  final bool status = false;
  // NotificationModel? notification;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    notifications();
  }

  List<NotificationModel> notificationss = [];

  notifications() async {
    var response = await GetNotificationsApi.getNotifications();
    log('$response');
    if (response.isNotEmpty) {
      notificationss = (response['notifications'] as List<dynamic>)
          .map((notifications) => NotificationModel.fromjson(notifications))
          .toList().reversed.toList();
      
      GetStorage box = GetStorage();
      update();
      box.read("api_token");
    }
  }
}

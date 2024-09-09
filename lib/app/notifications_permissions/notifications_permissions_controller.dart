import 'package:find_me/api/notifications/notification_permission_api.dart';
import 'package:find_me/models/notification_permission_model.dart';
import 'package:get/get.dart';

class NotificationsPermissionsController extends GetxController {
  static NotificationsPermissionsController intance = Get.find();
  bool emojiNotifications = false;
  bool profileNotifications = false;
  bool socialNotifications = false;

  @override
  void onInit() {
    super.onInit();
    getPermission();
  }

  getPermission() async {
    var response = await NotificationPermissionApi.getPermissions();
    if (response.isNotEmpty) {
      NotificationPermissionModel permissionModel =
          NotificationPermissionModel.fromJson(response['permission']);
      emojiNotifications = permissionModel.emoji!;
      profileNotifications = permissionModel.profile!;
      socialNotifications = permissionModel.social!;
      update();
    }
  }

  updatePermissions() async {
    var response = await NotificationPermissionApi.updatePermissions(
      emoji: emojiNotifications,
      profile: profileNotifications,
      social: socialNotifications,
    );
    if (response.isNotEmpty) {
      NotificationPermissionModel permissionModel =
          NotificationPermissionModel.fromJson(response['permission']);
      emojiNotifications = permissionModel.emoji!;
      profileNotifications = permissionModel.profile!;
      socialNotifications = permissionModel.social!;
      update();
    }
  }

  void toggleEmojiNotifications(bool value) {
    emojiNotifications = value;
    update();
    updatePermissions();
  }

  void toggleProfileNotifications(bool value) {
    profileNotifications = value;
    update();
    updatePermissions();
  }

  void toggleSocialNotifications(bool value) {
    socialNotifications = value;
    update();
    updatePermissions();
  }
}

import 'package:get/get.dart';

class NotificationsPermissionsController extends GetxController {
  static NotificationsPermissionsController intance = Get.find();
  bool emojiNotifications = false;
  bool photosNotifications = false;
  bool fileNotifications = false;
   

  void toggleEmojiNotifications(bool value) {
    emojiNotifications = value;
    update();
  }
  void togglePhotosNotifications(bool value) {
    photosNotifications = value;
    update();
  }
  void toggleFileNotifications(bool value) {
    fileNotifications = value;
    update();
  }
}

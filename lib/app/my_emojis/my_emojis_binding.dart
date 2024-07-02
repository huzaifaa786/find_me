import 'package:find_me/app/my_emojis/my_emojis_controller.dart';
import 'package:get/get.dart';

class MyEmojisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyEmojisController());
  }
}

import 'package:find_me/app/edit_url/edit_url_controller.dart';
import 'package:get/get.dart';

class EditUrlBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditUrlController());
  }
}

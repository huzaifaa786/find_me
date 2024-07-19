import 'package:find_me/app/coins/coins_store_controller.dart';
import 'package:find_me/app/edit_profile/edit_profile_controller.dart';
import 'package:find_me/app/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    
  }
}


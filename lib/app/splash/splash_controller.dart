import 'package:find_me/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  static SplashController instance = Get.find();

  // TODO: implement onInit
  @override
  void onInit() {
    super.onInit();
    initscreen();
  }

  void initscreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      checkFirstSeen();
    });
  }

  Future checkFirstSeen() async {
    String? apiToken = '';

    if (apiToken != '') {
    } else {
      Get.toNamed(AppRoutes.signin);
    }
  }
}

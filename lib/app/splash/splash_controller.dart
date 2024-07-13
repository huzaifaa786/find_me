import 'package:find_me/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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

  GetStorage box = GetStorage();

  Future checkFirstSeen() async {
    String? apiToken = box.read('api_token');
    print("API:$apiToken");
    if (apiToken != null) {
        Get.offNamed(AppRoutes.mainview);
      } else {
        Get.offNamed(AppRoutes.editaccountinformation);
      }
  }
}

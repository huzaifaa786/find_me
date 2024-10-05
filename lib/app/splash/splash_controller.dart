import 'package:find_me/api/auth_api/user_api.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  static SplashController instance = Get.find();
  GetStorage box = GetStorage();

  // TODO: implement onInit
  @override
  void onInit() {
    super.onInit();
    initscreen();
  }

  void initscreen() async {
    String? apiToken = box.read('api_token');
    if (apiToken != null) {
      var response = await UserApi().checkAccountStatus();
      print("rrrr:$response");
      if (response.isNotEmpty) {
        if (response['user']['is_blocked'] == 1) {
          UiUtilites.accountBlockedAlert(Get.context);
          await box.remove('api_token');
          await box.remove('beacon_id');
        } else {
          await Future.delayed(const Duration(seconds: 1), () {
            checkFirstSeen();
          });
        }
      } else {
        initscreen();
      }
    } else {
      await Future.delayed(const Duration(seconds: 3), () {
        checkFirstSeen();
      });
    }
  }

  Future checkFirstSeen() async {
    String? apiToken = box.read('api_token');
    if (apiToken != null) {
      Get.offNamed(AppRoutes.mainview);
    } else {
      Get.offNamed(AppRoutes.intro);
    }
  }
}

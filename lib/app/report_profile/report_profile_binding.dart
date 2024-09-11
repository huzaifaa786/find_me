import 'package:find_me/app/report_profile/report_profile_controller.dart';
import 'package:get/get.dart';

class ReportProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ReportProfileController());
  }
}
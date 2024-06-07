import 'package:find_me/app/report/report_controller.dart';
import 'package:get/get.dart';

class ReportsBinding extends Bindings{
  @override
  @override
  void dependencies() {
    Get.lazyPut(() => ReportController());
  }
}
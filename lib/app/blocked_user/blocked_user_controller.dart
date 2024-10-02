import 'package:find_me/api/block_report_api/block_report_api.dart';
import 'package:get/get.dart';

class BlockedUserController extends GetxController {
  static BlockedUserController instance = Get.find();
  List<Map<String, dynamic>> users = [];
  @override
  void onInit() {
    getBlockedUser();
    super.onInit();
  }

  getBlockedUser() async {
    users = [];
    var response = await BlockReportApi.getBlockUsers();
    if (response.isNotEmpty) {
      users = List.from(response['blocked_users'])
          .map((user) => user as Map<String, dynamic>)
          .toList();
    }
    update();
  }

  unblockUser(user) async {
    var response = await BlockReportApi.unBlockUser(user['id']);
    if (response.isNotEmpty) {
      users.remove(user);
    }
    update();
  }
}

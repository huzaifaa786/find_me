import 'package:find_me/app/home/home_controller.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  static EditProfileController get instance => Get.find();

  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;

  var isDefault1 = false;
  var isDefault2 = false;
  var isDefault3 = false;
  var isDefault4 = false;

  DropdownItem selectedItem = DropdownItem(
    avatarUrl:
        'https://th.bing.com/th/id/OIP.DmAJheE6apJ9IX7pxIRDjgHaFN?pid=ImgDet&w=474&h=333&rs=1',
    text: 'Almarwan General Trd',
    verified: true,
  );

  void toggleDefault1(bool value) {
    isDefault1 = value;
    isSelected1 = value;
    update();
  }

  void toggleDefault2(bool value) {
    isDefault2 = value;
    isSelected2 = value;
    update();
  }

  void toggleDefault3(bool value) {
    isDefault3 = value;
    isSelected3 = value;
    update();
  }

  void toggleDefault4(bool value) {
    isDefault4 = value;
    isSelected4 = value;
    update();
  }
}

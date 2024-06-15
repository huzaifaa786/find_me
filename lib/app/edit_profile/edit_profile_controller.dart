import 'package:find_me/app/home/home_controller.dart';
import 'package:flutter/material.dart';
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

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  DropdownItem selectedItem = DropdownItem(
    avatarUrl:
        'https://th.bing.com/th/id/OIP.DmAJheE6apJ9IX7pxIRDjgHaFN?pid=ImgDet&w=474&h=333&rs=1',
    text: 'Almarwan General Trd',
    verified: true,
  );

  @override
  void onInit() {
    super.onInit();
    controller1.text = 'Abdulllaaaaaaaaaaaaaahhhhhhhhhhhhhhhhhh';
    controller2.text = 'Almarwan General Trd';
    controller3.text = 'Another Profile';
    controller4.text = 'Yet Another Profile';
  }

  void toggleDefault(int index, bool value) {
    isDefault1 = isDefault2 = isDefault3 = isDefault4 = false;
    isSelected1 = isSelected2 = isSelected3 = isSelected4 = false;

    switch (index) {
      case 1:
        isDefault1 = value;
        isSelected1 = value;
        break;
      case 2:
        isDefault2 = value;
        isSelected2 = value;
        break;
      case 3:
        isDefault3 = value;
        isSelected3 = value;
        break;
      case 4:
        isDefault4 = value;
        isSelected4 = value;
        break;
    }

    update();
  }
}

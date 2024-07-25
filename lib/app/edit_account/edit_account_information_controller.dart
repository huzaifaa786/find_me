import 'package:find_me/api/auth_api/user_api.dart';
import 'package:find_me/api/change_information/change_information_api.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';

class EditAccountInformationController extends GetxController {
  static EditAccountInformationController instance = Get.find();
  UserModel? userModel;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  String gender = "";
  String? firstname;
  String? lastname;
  String? Birthday;

  //! Date of Birth Selection
  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = DateTime(now.year - 100, now.month, now.day);
    final DateTime lastDate = DateTime(now.year - 10, now.month, now.day);
    final DateTime initialDate = lastDate;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (picked != null) {
      dayController.text = picked.day.toString().padLeft(2, '0');
      monthController.text = picked.month.toString().padLeft(2, '0');
      yearController.text = picked.year.toString();
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void handleGenderSelected(String value) {
    gender = value;
    update();
  }

  Future<void> loadUserData() async {
    var response = await UserApi.getUser();
    if (response.isNotEmpty) {
      userModel = UserModel.fromJson(response['user']);
      firstNameController.text = userModel?.firstName ?? '';
      lastNameController.text = userModel?.lastName ?? '';
      gender = userModel?.gender ?? 'Male';

      if (userModel?.dob != null) {
        DateTime dob = DateTime.parse(userModel!.dob!);
        dayController.text = dob.day.toString().padLeft(2, '0');
        monthController.text = dob.month.toString().padLeft(2, '0');
        yearController.text = dob.year.toString();
      }
    }
  }

  Future<void> changeInformation() async {
    String dob =
        '${yearController.text}-${monthController.text}-${dayController.text}';

    var response = await ChangeInformationApi.ChangeInformation(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      dob: dob,
      gender: gender,
    );
    if (response.isNotEmpty) {
      UiUtilites.registerSuccessAlert(Get.context, "Change  Information Successfully");
    } else {
      UiUtilites.errorSnackbar(
          "Change Information Error", "Information is Not Change ");
    }
    update();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';

class EditAccountInformationController extends GetxController {
  static EditAccountInformationController instance = Get.find();
   TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  String gender = "Male";

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

    void handleGenderSelected(String value) {
    gender = value;
    update();
  }

}

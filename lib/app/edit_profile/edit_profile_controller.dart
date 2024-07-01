import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  static EditProfileController get instance => Get.find();

  final List<ProfileModel> profiles = [];

  @override
  void onInit() {
    super.onInit();
    initializeProfiles();
  }

  void initializeProfiles() {
    profiles.addAll([
      ProfileModel(
        isSelected: false,
        isDefault: false,
        controller: TextEditingController(
            text: 'Abdulllaaaaaaaaaaaaaahhhhhhhhhhhhhhhhhh'),
        avatarUrl:
            'https://th.bing.com/th/id/OIP.DmAJheE6apJ9IX7pxIRDjgHaFN?pid=ImgDet&w=474&h=333&rs=1',
        text: 'Almarwan General Trd',
        verified: true,
      ),

      ProfileModel(
        isSelected: false,
        isDefault: false,
        controller: TextEditingController(text: 'Almarwan General Trd'),
        avatarUrl:
            'https://th.bing.com/th/id/OIP.DmAJheE6apJ9IX7pxIRDjgHaFN?pid=ImgDet&w=474&h=333&rs=1',
        text: 'Almarwan General Trd',
        verified: true,
      ),
      ProfileModel(
        isSelected: false,
        isDefault: false,
        controller: TextEditingController(text: 'Another Profile'),
        avatarUrl:
            'https://th.bing.com/th/id/OIP.DmAJheE6apJ9IX7pxIRDjgHaFN?pid=ImgDet&w=474&h=333&rs=1',
        text: 'Another Profile',
        verified: false,
      ),
      ProfileModel(
        isSelected: false,
        isDefault: false,
        controller: TextEditingController(text: 'Yet Another Profile'),
        avatarUrl:
            'https://th.bing.com/th/id/OIP.DmAJheE6apJ9IX7pxIRDjgHaFN?pid=ImgDet&w=474&h=333&rs=1',
        text: 'Yet Another Profile',
        verified: false,
      ),
      // Add more profiles as needed
    ]);
  }

  void toggleDefault(int index) {
    if (profiles[index].isDefault) {
      profiles[index].isDefault = false;
      profiles[index].isSelected = false;
    } else {
      for (int i = 0; i < profiles.length; i++) {
        profiles[i].isDefault = false;
        profiles[i].isSelected = false;
      }
      profiles[index].isDefault = true;
      profiles[index].isSelected = true;
    }
    update();
  }

  void toggleSelection(int index) {
    profiles[index].isSelected = !profiles[index].isSelected;
    update();
  }
}

class ProfileModel {
  bool isSelected;
  bool isDefault;
  final TextEditingController controller;
  final String avatarUrl;
  final String text;

  ProfileModel({
    required this.isSelected,
    required this.isDefault,
    required this.controller,
    required this.avatarUrl,
    required this.text,
    required bool verified,
  });
}

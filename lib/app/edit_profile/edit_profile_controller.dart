import 'dart:convert';
import 'dart:io';

import 'package:find_me/api/auth_api/user_api.dart';
import 'package:find_me/api/profile_api/profile_api.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/models/user_profile_model.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  static EditProfileController get instance => Get.find();
  List<Profile> profiles = [
    Profile(name: 'Profile 1', image: null, isEditable: false, isLocked: false),
    Profile(name: 'Profile 2', image: null, isEditable: true, isLocked: false),
    Profile(name: 'Profile 3', image: null, isEditable: false, isLocked: true),
    Profile(name: 'Profile 4', image: null, isEditable: false, isLocked: true),
  ];

  int selectedProfileIndex = 0;
  UserModel? userModel;
  int profileLength = 0;
  List<UserProfileModel> userProfiles = [];
  UserProfileModel? currentProfile;
  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  getUser() async {
    var response = await UserApi.getUser();
    if (response.isNotEmpty) {
      userModel = UserModel.fromJson(response['user']);
      profileLength = userModel!.profiles!.length;
      userProfiles = userModel!.profiles!;
      currentProfile = userModel!.currentProfile;
      for (var i = 0; i < 4; i++) {
        if (userProfiles.asMap().containsKey(i) &&
            userProfiles[i].id == currentProfile?.id) {
          selectedProfileIndex = i;
          update();
        }
      }
      update();
      updateProfiles();
    }
  }

  void selectProfile(int index) async {
    selectedProfileIndex = index;

    UserProfileModel? userProfile = userProfiles[index];
    var response = await ProfileApi.updateCurrentProfile(
        userProfileId: userProfile.id, userId: userModel!.id);
    if (response.isNotEmpty) {
      userModel = UserModel.fromJson(response['user']);
      profileLength = userModel!.profiles!.length;
      userProfiles = userModel!.profiles!;
      currentProfile = userModel!.currentProfile;
      update();
      updateProfiles();
      UiUtilites.successSnackbar(" Marked as default Successfully", "");
    }
    update();
  }

  updateProfiles() {
    for (var i = 0; i < 4; i++) {
      if (userProfiles.asMap().containsKey(i)) {
        profiles[i].image = userProfiles[i].imageUrl;
        profiles[i].name = userProfiles[i].name!;

        update();
      }
    }
  }

  void updateProfileName(int index, String newName) async {
    UserProfileModel? userProfile;
    if (userProfiles.asMap().containsKey(index)) {
      userProfile = userProfiles[index];
    }

    var response = await ProfileApi.updateProfileName(
        name: newName, userProfileId: userProfile?.id, userId: userModel!.id);
    if (response.isNotEmpty) {
      userModel = UserModel.fromJson(response['user']);
      profileLength = userModel!.profiles!.length;
      userProfiles = userModel!.profiles!;
      profiles[index].name = userProfiles[index].name!;
      currentProfile = userModel!.currentProfile;

      update();
      updateProfiles();
    }

    update();
  }

  void updateProfileImage(int index, XFile newImage) async {
    UserProfileModel? userProfile;
    if (userProfiles.asMap().containsKey(index)) {
      userProfile = userProfiles[index];
    }
    String? base64Image;
    List<int> imageBytes = await File(newImage.path).readAsBytes();
    base64Image = base64Encode(imageBytes);

    var response = await ProfileApi.updateProfileImage(
        image: base64Image,
        userProfileId: userProfile?.id,
        userId: userModel!.id);
    if (response.isNotEmpty) {
      userModel = UserModel.fromJson(response['user']);
      profileLength = userModel!.profiles!.length;
      userProfiles = userModel!.profiles!;
      profiles[index].image = userProfiles[index].imageUrl;
      currentProfile = userModel!.currentProfile;
      update();
      updateProfiles();
    }
    update();
  }

  void toggleDefaultProfile(int index) {
    for (int i = 0; i < profiles.length; i++) {
      profiles[i].isDefault = i == index;
    }
    update();
  }

}

class Profile {
  String name;
  String? image;
  bool isEditable;
  bool isLocked;
  bool isDefault;

  Profile({
    required this.name,
    this.image,
    this.isEditable = false,
    this.isLocked = false,
    this.isDefault = false,
  });
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

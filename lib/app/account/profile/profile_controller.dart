import 'package:find_me/api/auth_api.dart/user_api.dart';
import 'package:find_me/models/profile_business_card_model.dart';
import 'package:find_me/models/profile_url_model.dart';
import 'package:find_me/models/user_model.dart';
import 'package:find_me/models/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();
  TextEditingController bioController = TextEditingController();
  UserModel? userModel;
  UserProfileModel? profile;
  ProfileBusinessCardModel? businessCardModel;
  ProfileUrlModel? profileUrlModel;
  late FocusNode focusNode;

  var i = 0;

  fggf() {
    i = 12;
    update();
  }

  bool isEditSelected = false;

  @override
  void onInit() {
    profile ??= Get.arguments;
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus && isEditSelected) {
        isEditSelected = false;
      }
    });

    getUser();
    super.onInit();
  }

  getUser() async {
    var response = await UserApi.getUser();
    if (response.isNotEmpty) {
      userModel = UserModel.fromJson(response['user']);
      businessCardModel = profile!.businessCard;
      bioController.text = profile!.bio!;
      if (profile!.urls != null) {
        profileUrlModel = profile!.urls;
      } else {
        profileUrlModel = ProfileUrlModel(id: 1, userProfileId: profile!.id);
      }

      update();
    }
  }
}

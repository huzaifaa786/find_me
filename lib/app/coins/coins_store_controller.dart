import 'dart:convert';

import 'package:find_me/api/coin_api.dart/coin_api.dart';
import 'package:find_me/models/coin_package_model.dart';
import 'package:find_me/models/user_model.dart';
import 'package:get/get.dart';

class CoinsStoreController extends GetxController {
  static CoinsStoreController instance = Get.find();

  List<CoinPackageModel> coinPackages = [];
  UserModel? userModel;

  @override
  void onInit() {
    getCoinPackages();
    super.onInit();
  }

  getCoinPackages() async {
    var response = await CoinApi.getCoinPackages();

    if (response.isNotEmpty) {
      coinPackages = [];
      coinPackages = List.from(response['data']['packages'])
          .map((package) =>
              CoinPackageModel.fromJson(package as Map<String, dynamic>))
          .toList();
      userModel = UserModel.fromJson(response['data']['user']);
      update();
    }
  }
}

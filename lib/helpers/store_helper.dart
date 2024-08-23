import 'package:purchases_flutter/purchases_flutter.dart';

class StoreHelper {
  final Store store;
  final String apiKey;
  static StoreHelper? _instance;

  factory StoreHelper({required Store store, required String apiKey}) {
    _instance ??= StoreHelper._internal(store, apiKey);
    return _instance!;
  }

  StoreHelper._internal(this.store, this.apiKey);

  static StoreHelper get instance {
    return _instance!;
  }

  static bool isForAppleStore() => instance.store == Store.appStore;

  static bool isForGooglePlay() => instance.store == Store.playStore;
}

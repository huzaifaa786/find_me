import 'package:find_me/api/subscription_api/subscription_api.dart';

class SubscriptionManager {
  static final SubscriptionManager _instance = SubscriptionManager._internal();

  bool _isProUser = false;

  factory SubscriptionManager() {
    return _instance;
  }

  SubscriptionManager._internal();

  bool get isProUser => _isProUser;

  void setProUserStatus(bool status) {
    _isProUser = status;
  }

  Future<void> updateBackendStatus() async {
    var response = await SubscriptionApi.updateStatus(status: isProUser);
    if (response.isNotEmpty) {}
  }
}

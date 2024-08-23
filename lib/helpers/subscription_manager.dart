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
    // Replace with your API call to update the user status in the backend
    // Example:
    // await http.post('your-backend-api-url', body: {'isProUser': _isProUser});
  }
}

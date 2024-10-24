import 'package:find_me/components/helper/loading.dart';
import 'package:find_me/helpers/store_helper.dart';
import 'package:find_me/helpers/subscription_manager.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

Future<void> configureSDK() async {
  await Purchases.setLogLevel(LogLevel.debug);

  PurchasesConfiguration configuration =
      PurchasesConfiguration(StoreHelper.instance.apiKey)..appUserID = null;

  await Purchases.configure(configuration);
  Purchases.addCustomerInfoUpdateListener(
    (customerInfo) {
      setIsProStatus(customerInfo);
    },
  );
  try {
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();
    setIsProStatus(customerInfo);
  } catch (e) {
    SubscriptionManager().setProUserStatus(false);
    await SubscriptionManager().updateBackendStatus();
  }
}

void setIsProStatus(CustomerInfo customerInfo) async {
  var isPro = customerInfo.entitlements.all["Premium Access"]?.isActive;
  if (isPro != null && isPro) {
    SubscriptionManager().setProUserStatus(true);
  } else {
    SubscriptionManager().setProUserStatus(false);
  }
  await SubscriptionManager().updateBackendStatus();
}

Future<void> purchaseSubscription(BuildContext context, Package package) async {
  try {
    LoadingHelper.show();
    CustomerInfo customerInfo = await Purchases.purchasePackage(package).whenComplete(() {
      LoadingHelper.dismiss();
    });
    var isPro = customerInfo.entitlements.all["Premium Access"]?.isActive;
    if (isPro != null && isPro) {
        FirebaseAnalytics.instance.logEvent(
          name: 'purchase_subscription',
        );
      SubscriptionManager().setProUserStatus(true);
      await SubscriptionManager().updateBackendStatus();
      LoadingHelper.dismiss();
    }
  } on PlatformException catch (e) {
    var errorCode = PurchasesErrorHelper.getErrorCode(e);
    if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
      try {
        LoadingHelper.dismiss();
        CustomerInfo customerInfo_ = await Purchases.getCustomerInfo();
        setIsProStatus(customerInfo_);
      } catch (e) {
        LoadingHelper.dismiss();
        SubscriptionManager().setProUserStatus(false);
        await SubscriptionManager().updateBackendStatus();
      }
    }
  }
}

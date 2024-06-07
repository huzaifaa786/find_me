import 'package:find_me/app/account/change_phonenumber/change_phonenumber_binding.dart';
import 'package:find_me/app/account/change_phonenumber/change_phonenumber_view.dart';
import 'package:find_me/app/account/profile/account_binding.dart';
import 'package:find_me/app/account/profile/account_view.dart';
import 'package:find_me/app/auth/signup/signup_binding.dart';
import 'package:find_me/app/auth/signup/signup_view.dart';
import 'package:find_me/app/intro/intro_binding.dart';
import 'package:find_me/app/intro/intro_view.dart';
import 'package:find_me/app/notifications/notifications_binding.dart';
import 'package:find_me/app/notifications/notifications_view.dart';
import 'package:find_me/app/setting/setting_binding.dart';
import 'package:find_me/app/setting/setting_view.dart';
import 'package:find_me/app/splash/splash_binding.dart';
import 'package:find_me/app/splash/splash_view.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    //TODO:  [Splash Route]
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),

    //TODO:  [Choose login or signup]
    GetPage(
      name: AppRoutes.intro,
      page: () => const IntroView(),
      binding: IntroBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),

    //TODO: [Signup Route]
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),

    //TODO: [Account Route]
    GetPage(
      name: AppRoutes.account,
      page: () => const AccountView(),
      binding: AccountBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO: [notification Route]
    GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),
     //TODO: [change phone number Route]
    GetPage(
      name: AppRoutes.changephonenumber,
      page: () => const ChangePhoneNumberView(),
      binding: ChangePhoneNumberBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),

     GetPage(
      name: AppRoutes.setting,
      page: () => const SettingView(),
      binding: SettingBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),
  ];
}

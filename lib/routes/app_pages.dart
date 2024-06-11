import 'package:find_me/app/account/change_phonenumber/change_phonenumber_binding.dart';
import 'package:find_me/app/account/change_phonenumber/change_phonenumber_view.dart';
import 'package:find_me/app/auth/changepassword/changepassword_binding.dart';
import 'package:find_me/app/auth/changepassword/changepassword_view.dart';
import 'package:find_me/app/auth/forgetpassword/forgetpassword_binding.dart';
import 'package:find_me/app/auth/forgetpassword/forgetpassword_view.dart';
import 'package:find_me/app/auth/otp/otp_binding.dart';
import 'package:find_me/app/auth/otp/otp_view.dart';
import 'package:find_me/app/auth/signin/signin_binding.dart';
import 'package:find_me/app/auth/signin/signin_view.dart';
import 'package:find_me/app/account/profile/profile_binding.dart';
import 'package:find_me/app/account/profile/profile_view.dart';
import 'package:find_me/app/auth/signup/signup_binding.dart';
import 'package:find_me/app/auth/signup/signup_view.dart';
import 'package:find_me/app/home/home_binding.dart';
import 'package:find_me/app/home/home_view.dart';
import 'package:find_me/app/intro/intro_binding.dart';
import 'package:find_me/app/intro/intro_view.dart';
import 'package:find_me/app/languages/languages_binding.dart';
import 'package:find_me/app/languages/languages_view.dart';
import 'package:find_me/app/main_view/main_binding.dart';
import 'package:find_me/app/main_view/main_view.dart';
import 'package:find_me/app/notifications/notifications_binding.dart';
import 'package:find_me/app/notifications/notifications_view.dart';
import 'package:find_me/app/report/report_binding.dart';
import 'package:find_me/app/report/report_view.dart';
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
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO: [notification Route]
    GetPage(
      name: AppRoutes.notifications,
      page: () =>  NotificationsView(),
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

    //TODO: [SignIn Route]
    GetPage(
      name: AppRoutes.signin,
      page: () => const SignInView(),
      binding: SignInBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),

    //TODO: [forgetpassword Route]
    GetPage(
      name: AppRoutes.forgetpassword,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    //TODO: [home Route]
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),

    //TODO: [report Route]
    GetPage(
      name: AppRoutes.report,
      page: () => const ReportView(),
      binding: ReportsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),
     //? BOTTOM NAVIGATION VIEW Route
    GetPage(
      name: AppRoutes.mainview,
      page: () => const MainView(),
      binding: MainBinding(),
       transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),
      //? change password Route
    GetPage(
      name: AppRoutes.changepassword,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
       transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
   
    ),

    //TODO: [Otp Route]
    GetPage(
      name: AppRoutes.otp,
      page: () => const OtpView(),
      binding: OtpBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),
 //TODO: [language Route]
    GetPage(
      name: AppRoutes.language,
      page: () => const LanguagesView(),
      binding: LanguagesBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),
  ];
}

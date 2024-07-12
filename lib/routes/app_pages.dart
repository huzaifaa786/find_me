// ignore_for_file: prefer_const_constructors

import 'package:find_me/app/account/change_phonenumber/change_phonenumber_binding.dart';
import 'package:find_me/app/account/change_phonenumber/change_phonenumber_view.dart';
import 'package:find_me/app/auth/changepassword/changepassword_binding.dart';
import 'package:find_me/app/auth/changepassword/changepassword_view.dart';
import 'package:find_me/app/auth/email_otp/email_otp_binding.dart';
import 'package:find_me/app/auth/email_otp/email_otp_view.dart';
import 'package:find_me/app/auth/forgetpassword/forget_password_otp/forget_password_otp_binding.dart';
import 'package:find_me/app/auth/forgetpassword/forget_password_otp/forget_password_otp_view.dart';
import 'package:find_me/app/auth/forgetpassword/forgetpassword_binding.dart';
import 'package:find_me/app/auth/forgetpassword/forgetpassword_view.dart';

import 'package:find_me/app/auth/forgetpassword/toggle_screens/email_view.dart';
import 'package:find_me/app/auth/new_password/new_password_binding.dart';
import 'package:find_me/app/auth/new_password/new_password_view.dart';
import 'package:find_me/app/auth/otp/otp_binding.dart';
import 'package:find_me/app/auth/otp/otp_view.dart';
import 'package:find_me/app/auth/phone_otp/phone_otp_binding.dart';
import 'package:find_me/app/auth/phone_otp/phone_otp_view.dart';
import 'package:find_me/app/auth/signin/signin_binding.dart';
import 'package:find_me/app/auth/signin/signin_view.dart';
import 'package:find_me/app/account/profile/profile_binding.dart';
import 'package:find_me/app/account/profile/profile_view.dart';
import 'package:find_me/app/auth/signup/signup_binding.dart';
import 'package:find_me/app/auth/signup/signup_view.dart';
import 'package:find_me/app/beacon/beacon_broadcaster/beacon_broadcaster_binding.dart';
import 'package:find_me/app/beacon/beacon_broadcaster/beacon_broadcaster_view.dart';
import 'package:find_me/app/beacon/beacon_scanner/beacon_scanner_binding.dart';
import 'package:find_me/app/beacon/beacon_scanner/beacon_scanner_view.dart';
import 'package:find_me/app/updata_phone_number%5D/updata_phone_number_binding.dart';
import 'package:find_me/app/updata_phone_number%5D/updata_phone_number_view.dart';
import 'package:find_me/app/create_business_card/create_card_binding.dart';
import 'package:find_me/app/create_business_card/create_card_view.dart';
import 'package:find_me/app/edit_profile/edit_profile_binding.dart';
import 'package:find_me/app/edit_profile/edit_profile_view.dart';
import 'package:find_me/app/edit_url/edit_url_binding.dart';
import 'package:find_me/app/edit_url/edit_url_view.dart';
import 'package:find_me/app/emoji_menu/emoji_menu_bindings.dart';
import 'package:find_me/app/emoji_menu/emoji_menu_view.dart';
import 'package:find_me/app/gifted_emoji/gifted_emoji_binding.dart';
import 'package:find_me/app/gifted_emoji/gifted_emoji_view.dart';
import 'package:find_me/app/home/home_binding.dart';
import 'package:find_me/app/home/home_view.dart';
import 'package:find_me/app/intro/intro_binding.dart';
import 'package:find_me/app/intro/intro_view.dart';
import 'package:find_me/app/languages/languages_binding.dart';
import 'package:find_me/app/languages/languages_view.dart';
import 'package:find_me/app/location/location_binding.dart';
import 'package:find_me/app/location/location_view.dart';
import 'package:find_me/app/main_view/main_binding.dart';
import 'package:find_me/app/main_view/main_view.dart';
import 'package:find_me/app/my_emojis/my_emojis_binding.dart';
import 'package:find_me/app/my_emojis/my_emojis_view.dart';
import 'package:find_me/app/notifications/notifications_binding.dart';
import 'package:find_me/app/notifications/notifications_view.dart';
import 'package:find_me/app/notifications_permissions/notifications_permissions_binding.dart';
import 'package:find_me/app/notifications_permissions/notifications_permissions_view.dart';
import 'package:find_me/app/policies/policies_binding.dart';
import 'package:find_me/app/policies/policies_view.dart';
import 'package:find_me/app/privacy/privacy_binding.dart';
import 'package:find_me/app/privacy/privacy_view.dart';
import 'package:find_me/app/report/report_binding.dart';
import 'package:find_me/app/report/report_view.dart';
import 'package:find_me/app/setting/setting_binding.dart';
import 'package:find_me/app/setting/setting_view.dart';
import 'package:find_me/app/social_login/social_login_binding.dart';
import 'package:find_me/app/social_login/social_login_view.dart';
import 'package:find_me/app/splash/splash_binding.dart';
import 'package:find_me/app/splash/splash_view.dart';
import 'package:find_me/app/subscriptions/subscriptions_binding.dart';
import 'package:find_me/app/subscriptions/subscriptions_view.dart';
import 'package:find_me/app/support/support_binding.dart';
import 'package:find_me/app/support/support_view.dart';
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
    GetPage(
      name: AppRoutes.phoneOtp,
      page: () => const PhoneOtpView(),
      binding: PhoneOtpBinding(),
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

    GetPage(
      name: AppRoutes.beaconScanner,
      page: () => const BeaconScannerView(),
      binding: BeaconScannerBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: AppRoutes.beaconBroadcaster,
      page: () => const BeaconBroadcasterView(),
      binding: BeaconBroadcasterBinding(),
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
      page: () => NotificationsView(),
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

    //TODO: [NavBar Route]   //? BOTTOM NAVIGATION VIEW Route
    GetPage(
      name: AppRoutes.mainview,
      page: () => const MainView(),
      binding: MainBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),

    //TODO: [Change Password Route]  //? change password Route
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
    //TODO: [location Route]
    GetPage(
      name: AppRoutes.location,
      page: () => const LocationView(),
      binding: LocationBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    //TODO: [change email Route]
    GetPage(
      name: AppRoutes.updata_phone_Number,
      page: () => const UpdataPhoneNumberView(),
      binding: UpdataPhoneNumberBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    //TODO: [change phone Route]
    GetPage(
      name: AppRoutes.change_phone,
      page: () => const ChangePhoneNumberView(),
      binding: ChangePhoneNumberBinding(),
    ),
    //TODO: [support Route]
    GetPage(
      name: AppRoutes.support,
      page: () => const SupportView(),
      binding: SupportBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    //TODO: [editProfile Route]
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    //TODO: [policies Route]
    GetPage(
      name: AppRoutes.policies,
      page: () => const PoliciesView(),
      binding: PoliciesBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    //TODO: [createCard Route]
    GetPage(
      name: AppRoutes.createcard,
      page: () => const CreateCardView(),
      binding: CreateCardBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    //TODO: [Social Login Route]
    GetPage(
      name: AppRoutes.sociallogin,
      page: () => const SocialLoginView(),
      binding: SocialLoginBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO: [EditUrlView Route]
    GetPage(
      name: AppRoutes.editurl,
      page: () => const EditUrlView(),
      binding: EditUrlBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO: [Subscriptions Route]
    GetPage(
      name: AppRoutes.subscriptions,
      page: () => const SubscriptionsView(),
      binding: SubscriptionsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO: [Privacy  Route]
    GetPage(
      name: AppRoutes.privacy,
      page: () => PrivacyView(),
      binding: PrivacyBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO: [NotificationsPermissions  Route]
    GetPage(
      name: AppRoutes.notificationsPermissions,
      page: () => NotificationsPermissionsView(),
      binding: NotificationsPermissionsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO: [EmojiMenu Route]
    GetPage(
      name: AppRoutes.edit_menu,
      page: () => EmojiMenuView(),
      binding: EmojiMenuBindings(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO: [Gifted_Emoji Route]
    GetPage(
      name: AppRoutes.gifted_emoji,
      page: () => GiftedEmojiView(),
      binding: GiftedEmojiBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO: [My_Emojis Route]
    GetPage(
      name: AppRoutes.my_emojis,
      page: () => MyEmojisView(),
      binding: MyEmojisBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO: [My_Emojis Route]
    GetPage(
      name: AppRoutes.email_otp,
      page: () => EmailOtpView(),
      binding: EmailOtpBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO: [My_Emojis Route]
    GetPage(
      name: AppRoutes.forgetpassword_otp,
      page: () => ForgetPasswordOtpView(),
      binding: ForgetPasswordOtpBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),
     GetPage(
      name: AppRoutes.new_password,
      page: () => NewPasswordView(),
      binding: NewPasswordBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),
  ];
}

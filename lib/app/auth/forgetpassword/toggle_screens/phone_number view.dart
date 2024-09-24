import 'package:find_me/app/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/textfields/phone_inputfield.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PhoneNumberView extends StatefulWidget {
  const PhoneNumberView({super.key});

  @override
  State<PhoneNumberView> createState() => _PhoneNumberViewState();
}

class _PhoneNumberViewState extends State<PhoneNumberView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
        builder: (controller) => Column(
              children: [
                Gap(50.h),
                PhoneInputField(
                  onCountryChanged: controller.onCountryChanged,
                  errorText: controller.invalidNumberMessage,
                  onChanged: controller.phoneValidation,
                  controller: controller.pcontroller,
                ),
                Gap(50.h),
                AppButton(
                  title: 'Send'.tr,
                  height: 50.0.h,
                  width: 304.0.w,
                  onTap: () async {
                    await controller.forgetPasswordUser();
                    if (controller.isCodeEntered) {
                      Get.toNamed(AppRoutes.forgetpassword_otp);
                    }
                  },
                ),
                if (controller.invalidNumberMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      controller.invalidNumberMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  )
              ],
            ));
  }
}

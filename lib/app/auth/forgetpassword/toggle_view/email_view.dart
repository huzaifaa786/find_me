import 'package:find_me/app/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/components/textfields/app_textfields.dart';
import 'package:find_me/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EmailView extends StatelessWidget {
  const EmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
        builder: (controller) => Column(
              children: [
                Gap(50.h),
                AppTextFields(
                  enabled: true,
                  hintText: "Enter The Email",
                  controller: controller.emailController,
                ),
                Gap(40.h),
                AppButton(
                  title: 'Confirm',
                  height: 50.0.h,
                  width: 304.0.w,
                  onTap: () {},
                ),
              ],
            ));
  }
}

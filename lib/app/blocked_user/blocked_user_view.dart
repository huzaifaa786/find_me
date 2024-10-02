import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/app/blocked_user/blocked_user_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/components/buttons/app_button.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class BlockedUserView extends StatelessWidget {
  const BlockedUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlockedUserController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                toolbarHeight: 83.h,
                title: topBar(name: 'Blocked Users'.tr),
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
              ),
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Expanded(
                      child: controller.users.isNotEmpty ?   ListView.builder(
                        itemCount: controller.users.length,
                        itemBuilder: (context, index) {
                          var user = controller.users[index];
                          return Column(
                            children: [
                            ListTile(
                                  dense: true,
                                  minTileHeight: 64.0,
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30.r,
                                    child: ClipOval(
                                      child: user['blocked_profile']['image'] !=
                                              null
                                          ? CachedNetworkImage(
                                              imageUrl: user['blocked_profile']
                                                      ['image'] ??
                                                  '',
                                              fit: BoxFit.cover,
                                            )
                                          : SvgPicture.asset(
                                              "assets/images/User.svg"),
                                    ),
                                  ),
                                  title: Text(
                                    user['blocked_profile']['name'],
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  trailing: AppButton(
                                    height: 35.h,
                                    width: 80.w,
                                    title: "Unblock".tr,
                                    onTap: () {
                                      controller.unblockUser(user);
                                    },
                                  )),
                              Divider(
                                thickness: 1,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                            ],
                          );
                        },
                      ):Center(heightFactor: 15, child: AppText(title: "No Blocked User",size: 12,fontWeight: FontWeight.w600,textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
              )),
            ));
  }
}

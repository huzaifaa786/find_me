import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_me/app/my_emojis/my_emojis_controller.dart';
import 'package:find_me/components/appbars/topbar.dart';
import 'package:find_me/models/emoji_model.dart';
import 'package:find_me/utils/app_text/app_text.dart';
import 'package:find_me/utils/colors/app_colors.dart';
import 'package:find_me/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class MyEmojisView extends StatefulWidget {
  const MyEmojisView({super.key});

  @override
  State<MyEmojisView> createState() => _MyEmojisViewState();
}

class _MyEmojisViewState extends State<MyEmojisView> {
  GetStorage box = GetStorage();
  String coins = "";
  Widget buildItem(EmojiModel emoji, int index, MyEmojisController controller) {
    return Container(
      key: ValueKey(emoji),
      decoration: index < 6
          ? BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Grey thin border for first 6 items
                width: 1, // Border width
              ),
              borderRadius: BorderRadius.circular(10),
            )
          : null, // No decoration for emojis after the first 6
      padding: index < 6 ? EdgeInsets.all(4.w) : null, // Padding for first 6
      child: GestureDetector(
        onTap: () {
          UiUtilites.accountAlert(context,
              text: "Are you sure you want to remove emoji", onTapYes: () {
            controller.deleteEmoji(emoji.id!);
            Get.back();
          }, onTapNo: () {
            Get.back();
          });
        },
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: emoji.image,
              width: 80.w, // Larger emoji size
              height: 70.h,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  width: 120,
                  height: 120,
                ),
              ), // Larger emoji size
            ),
            if (emoji.type != "free") // Show coins only for non-free emojis
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/coins.svg",
                    height: 18.23.h,
                    width: 19.09.w,
                  ),
                  Text(
                    emoji.coins.toString(),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyEmojisController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: topBar(
            name: "My Emojis".tr,
            showBackIcon: true,
          ),
        ),
        body: Directionality(
          textDirection: box.read('locale') != 'ar'
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: Column(
                  children: [
                    Gap(35.h),
                    Align(
                      alignment:  box.read('locale') != 'ar' ?Alignment.centerLeft :Alignment.centerRight,
                      child: AppText(
                        title: "Favorites".tr,
                        fontWeight: FontWeight.w600,
                        size: 16,
                      ),
                    ),
                    Gap(6),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        title:
                            "The first 6 icons will be displayed on your profile for other users on find me to view. You can arrange the icons in your preferred order."
                                .tr,
                        fontWeight: FontWeight.w300,
                        size: 12,
                        color: AppColors.black.withOpacity(0.67),
                      ),
                    ),
                    Gap(20),
                    ReorderableGridView.count(
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      crossAxisCount: 3,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      onReorder: (oldIndex, newIndex) {
                        setState(() {
                          final element =
                              controller.allEmojis.removeAt(oldIndex);
                          controller.allEmojis.insert(newIndex, element);
                          controller.updateEmojiOrder();
                        });
                      },
                      children:
                          List.generate(controller.allEmojis.length, (index) {
                        return buildItem(
                            controller.allEmojis[index], index, controller);
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:find_me/utils/app_text/app_text.dart';
// import 'package:find_me/utils/colors/app_colors.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gap/gap.dart';

// class Checkbox extends StatelessWidget {
//   const Checkbox({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return   Row(
//                   children: [
//                     Gap(36.w),
//                     GestureDetector(
//                       onTap: () {
//                         controller.toggleDefault(!controller.isDefault);
//                       },
//                       child: Container(
//                         height: 68.h,
//                         width: 290.w,
//                         decoration: BoxDecoration(
//                           color: AppColors.border_grey,
//                           borderRadius: BorderRadius.circular(40),
//                         ),
//                         child: Row(
//                           children: [
//                             Checkbox(
//                               shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(1)),
//                               side: BorderSide(
//                                 color: AppColors.primary_color,
//                                 // width: 1,
//                               ),
//                               value: controller.isDefault,
//                               onChanged: (value) {
//                                 controller.toggleDefault(value ?? false);
//                               },
//                             ),
//                             Container(
//                               height: 50,
//                               width: 50,
//                               decoration: BoxDecoration(
//                                 // color: Colors.blue,
//                                 borderRadius: BorderRadius.circular(80.r),
//                                 border: Border.all(
//                                   color:
//                                       AppColors.primary_color, // Border color
//                                   width: 1, // Border width
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: AppColors.shadow_black
//                                         .withOpacity(0.25),
//                                     spreadRadius: 1,
//                                     blurRadius: 10.7,
//                                     offset: Offset(0, 0),
//                                   ),
//                                 ],
//                                 image: DecorationImage(
//                                   image: CachedNetworkImageProvider(
//                                     controller.selectedItem.avatarUrl,
//                                   ),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             Gap(10.h),
//                             AppText(
//                               title: 'Almarwan general trd',
//                               size: 10,
//                               fontWeight: FontWeight.w500,
//                             ),
//                             Gap(10.h),
//                             SvgPicture.asset('assets/icons/verified.svg'),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Gap(8.w),
//                     AppText(
//                       title: 'Edit',
//                       size: 11,
//                       color: AppColors.primary_color,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ],
//                 );
             
//   }
// }
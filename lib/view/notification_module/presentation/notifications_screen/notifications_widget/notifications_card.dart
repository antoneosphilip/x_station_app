//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:x_station_app/core/assets_manager/assets_manager.dart';
// import 'package:x_station_app/core/style_font_manager/style_manager.dart';
// import 'package:x_station_app/view_model/block/home_layout_cubit/home_layoout_cubit.dart';
//
// import '../../../../../core/color_manager/color_manager.dart';
// import '../../../../../model/notification_model/notification_model.dart';
//
//
// class NotificationsCard extends StatelessWidget {
//   const NotificationsCard({super.key, required this.notificationModelData});
//
//
//   bool typeOfMessage() {
//     return notificationModelData.body!.notificationType == "message_sent";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: 10.h, bottom: 5.h, right: 10.w, left: 10.w),
//       child: Container(
//         width: ScreenUtil().screenWidth,
//         height: 120.h,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16.sp),
//           color: ColorManager.colorWhite,
//           boxShadow: const [
//             BoxShadow(
//                 blurRadius: 2,
//                 color: Colors.grey,
//                 offset: Offset(0, 0),
//                 spreadRadius: 1)
//           ],
//         ),
//         child: Padding(
//           padding: EdgeInsets.only(right: 15.w, left: 10.w),
//           child: GestureDetector(
//             onTap: () {
//               if (typeOfMessage()) {
//                 HomeLayoutCubit.get(context).bottomTap(2);
//                 Get.back();
//               } else {
//                 // state 2 order screen .
//                 // Navigator.pushNamed(context, "/orders_screen");
//               }
//             },
//             child: Row(
//               children: [
//                 Container(
//                   width: 80.w,
//                   height: 80.h,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16.sp),
//                     color: ColorManager.colorWhite,
//                   ),
//                   child: Padding(
//                       padding: EdgeInsets.all(8.sp),
//                       child: typeOfMessage()
//                           ? SvgPicture.asset(
//                               AssetsImage.chat,
//                               color: ColorManager.colorPrimary,
//                             )
//                           : SvgPicture.asset(
//                         AssetsImage.chat,
//                               color: ColorManager.colorPrimary,
//                             )),
//                 ),
//                 SizedBox(
//                   width: 10.w,
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       width: 250.w,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text(
//                             "${typeOfMessage() ? "Message" : "Orders"} ",
//                             style: TextStyleManager.textStyle16w500,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(right: 8.w),
//                             child: Text(
//                               notificationModelData.createdAt!,
//                               style: TextStyleManager.textStyle16w500,
//
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     Text(
//                       notificationModelData.body!.message!,
//                       style:    TextStyleManager.textStyle16w500,
//
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

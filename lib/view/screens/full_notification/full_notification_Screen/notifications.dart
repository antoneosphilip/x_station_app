import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';

class FullNotificationScreen extends StatelessWidget {
  const FullNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 134.h,
                  decoration: BoxDecoration(
                      color: ColorManager.colorWhite,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25), // #000000 with 25% opacity
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4), // X: 0, Y: 4
                        ),
                      ],
                      borderRadius:
                           BorderRadius.vertical(bottom: Radius.circular(40.r))
                  ),
                  child: Row(children: [
                     SizedBox(
                      width: 12.w,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        Get.back();
                      },
                      backgroundColor: ColorManager.colorPrimary,
                      child: SvgPicture.asset(AssetsImage.arrowLeft),
                    ),
                    SizedBox(
                      width: 47.w,
                    ),
                    Padding(
                      padding:  EdgeInsets.all(8.0.sp),
                      child: Container(
                        alignment: Alignment.center,
                        height: 56.h,
                        width: 56.w,
                        decoration: BoxDecoration(
                            color: ColorManager.colorXGrey,
                            borderRadius: BorderRadius.circular(35.r)),
                        child: Text("XS",
                            style: TextStyleManager.textStyle36w700.copyWith(
                                color: ColorManager.colorPrimary)),
                      ),
                    ),
                     SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      TextManager.appName,
                      style: TextStyleManager.textStyle20w700,
                    )
                  ]),
                ),
                 SizedBox(
                  height: 10.h,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 148.w,
                  height: 37.h,
                  decoration: BoxDecoration(
                      color: ColorManager.colorPrimary,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Text(
                    "september 20",
                    style: TextStyleManager.textStyle11w700.copyWith(color: ColorManager.colorWhite),
                  ),
                ),
                 SizedBox(
                  height: 19.h,
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 12.w, right: 64.w),
                  child: Container(
                    alignment: Alignment.center,
                    width: 284.w,
                    decoration: BoxDecoration(
                        color: ColorManager.colorPrimary.withOpacity(.40),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding:  EdgeInsets.only(left: 13.w, right: 33.w,top: 13.h,bottom: 13.h),
                      child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit",
                        style: TextStyleManager.textStyle11w700.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 9.h, left: 24.w, right: 250.w),
                  child: const Text("10:30 pm",
                      style: TextStyle(color: Color.fromRGBO(10, 0, 0, 0.6))),
                ),


              ],
            )));
  }
}

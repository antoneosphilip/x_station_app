import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/style_font_manager/style_manager.dart';
import '../../../../core/text_manager/text_manager.dart';
import '../../../core_widget/elevated_button/elevated_button_custom.dart';


Future LogOutDialog({required String email}) async {
  return Get.defaultDialog(
      title: "log out".tr,
      backgroundColor: ColorManager.colorWhite,
      content: SizedBox(
        height: 100.h,
        child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text("sure log out".tr,

            )),
      ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButtonCustom(
                height: 50,
                width: 150,
                widget: Text(
                    "no".tr,

                ),
                textColor: ColorManager.colorWhite,
                onPressed: () {
                  Get.back();
                },
                colors: ColorManager.colorPrimary,
              ),
              SizedBox(
                width: 20.w,
              ),
             ElevatedButtonCustom(
  borderColor: ColorManager.colorPrimary,
  height: 50,
  width: 100,
  widget: Text(
  "Yes".tr,

  ),
  colors: ColorManager.colorWhite,
  onPressed: () async {
  },
  ),

            ],

          ),
        ),
  ]
  );

}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(PageName.electricianDetails);
      },
      child: Column(
        children: [
          Container(
            width: 153.w,
            color: ColorManager.colorSecondary,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
              child: Image.asset(AssetsImage.electrican,fit: BoxFit.cover,),
            ),
          ),
          Text(
            "electrican",
            style: TextStyleManager.textStyle24w300.copyWith(fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

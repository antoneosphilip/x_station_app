import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/style_font_manager/style_manager.dart';

class HomeTopServiceItem extends StatelessWidget {
  const HomeTopServiceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(PageName.applyScreen);
      },
      child: Padding(
        padding:  EdgeInsets.only(right: 21.w),
        child: Container(
          width: 323.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: ColorManager.colorXXPrimary
          ),
          child: Padding(
            padding:  EdgeInsets.only(left: 19.w),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 7.h,),
                      Text("problem here", style: TextStyleManager.textStyle14w500,),
                      SizedBox(height: 8.h,),
                      Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit",
                        style: TextStyleManager.textStyle10w400.copyWith(fontSize: 8.sp),),
                      SizedBox(height: 12.h,),
                      Row(
                        children: [
                          Text("Technician",style: TextStyleManager.textStyle10w400.copyWith(fontSize: 8.sp) ,),
                          SizedBox(width: 14.w,),
                          Text("plubmer",style: TextStyleManager.textStyle10w400.copyWith(fontSize: 8.sp) ,),

                        ],
                      ),
                      SizedBox(height: 6.h,)

                    ],
                  ),
                ),
                SizedBox(width: 11.w,),
                Text("15.00 \$ hr",style: TextStyleManager.textStyle10w400.copyWith(fontWeight: FontWeight.w800),),
                SizedBox(width: 7.w,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

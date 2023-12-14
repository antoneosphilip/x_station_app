import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/view/screens/everent/custom_ratting_bar/custom_rating_bar.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/style_font_manager/style_manager.dart';

class ElectricianDetailsItem extends StatelessWidget {
  const ElectricianDetailsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(PageName.electricianInformation);
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Container(
          width: 340.w,
          height: 100.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: ColorManager.colorXWhite.withOpacity(.40)
          ),
          child: Padding(
            padding:  EdgeInsets.all(5.0.sp),
            child: Row(
              children: [
                Container(
                    width: 96.w,
                    height: 96.w,
                    decoration: BoxDecoration(
                      color: ColorManager.colorXGrey,
                      borderRadius: BorderRadius.circular(35.w),
                    ),
                    child: Center(child: SvgPicture.asset(AssetsImage.clean,fit: BoxFit.cover,))
                ),
                SizedBox(width: 16.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("deep cleaning",style: TextStyleManager.textStyle14w500.copyWith(color: ColorManager.colorLightBlack,fontWeight: FontWeight.w400),),
                    SizedBox(height: 10.h,),
                    Text("15 \$ / hr",style: TextStyleManager.textStyle14w500.copyWith(color: ColorManager.colorDarkBlue),),
                    SizedBox(height: 8.h,),
                    Row(
                      children: [
                        const CustomRattingBar(size: 17,),
                        SizedBox(width: 5.w,),
                        Text("4.5",style: TextStyleManager.textStyle14w500.copyWith(color: ColorManager.colorLightBlack),),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding:  EdgeInsets.only(bottom: 57.14.h),
                  child: SvgPicture.asset(AssetsImage.heart),
                ),
                SizedBox(width: 33.2.w,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

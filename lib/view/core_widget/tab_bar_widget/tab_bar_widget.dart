import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';

import '../../../core/color_manager/color_manager.dart';
import '../../../core/style_font_manager/style_manager.dart';

class AppBarWidget extends StatelessWidget {
  final String? text;
  final double? rightPadding;
  final double? rightPaddingText;
  final double? height;
  final double? bottomIcon;
  final double? bottomText;
  final bool? isSearch;
  final bool? isArrow;

  const AppBarWidget(
      {super.key,
        this.text,
        this.rightPadding = 114,
        this.rightPaddingText = 154,
        this.height = 124,
        this.bottomIcon = 40,
        this.bottomText = 39,
        this.isSearch = false, this.isArrow=true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: height!.h,
      decoration: BoxDecoration(
        color: ColorManager.colorPrimary,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.w),
            bottomRight: Radius.circular(16.w)),
      ),
      child: Row(

        children: [
          isArrow==true?
          Padding(
            padding:  EdgeInsets.only(left: 34.w),
            child: SvgPicture.asset(AssetsImage.arrowLeft,color: ColorManager.colorWhite,),
          ):const SizedBox(),
          const Spacer(),
          Text(
            text!,
            style: TextStyleManager.textStyle24w500.copyWith(fontSize: 22.sp,color: ColorManager.colorWhite),
          ),
          Spacer(),

        ],
      ),
    );
  }
}



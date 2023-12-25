import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';

import '../../../../../view_model/block/profile_cubit/profile_cubit.dart';

class ApplyForm extends StatelessWidget {
  final String title;
  final String description;
  const ApplyForm({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 286, top: 34),
          child: Text(
            TextManager.Problem.tr,
            style: TextStyleManager.textStyle20w400.copyWith(color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorBlack),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 78, top: 16),
          child: Text(
            title,
            style: TextStyleManager.textStyle24w300.copyWith(color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorBlack),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 255, top: 26),
          child: Text(
            TextManager.Description.tr,
            style: TextStyleManager.textStyle20w400.copyWith(color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorBlack),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Container(
          width: 325.w,
          height: 256.h,
          decoration: BoxDecoration(
            color: ProfileCubit.get(context).isDark?ColorManager.colorLightDark:ColorManager.colorPrimary.withOpacity(.30),
            borderRadius: BorderRadius.circular(20.r)
          ),
          child: Padding(
            padding:  EdgeInsets.only(top: 10.h,left: 14.w,right: 39.w),
            child: Text(
            "${description}",
              style: TextStyleManager.textStyle16w500.copyWith(color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorBlack),
            ),
          ),
        ),
      ],
    );
  }
}

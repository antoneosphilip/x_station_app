import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';

class ApplyForm extends StatelessWidget {
  const ApplyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 286, top: 34),
          child: Text(
            TextManager.Problem,
            style: TextStyleManager.textStyle20w400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 78, top: 16),
          child: Text(
            TextManager.LoremIpsum,
            style: TextStyleManager.textStyle24w300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 255, top: 26),
          child: Text(
            TextManager.Description,
            style: TextStyleManager.textStyle20w400,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Container(
          width: 325.w,
          height: 256.h,
          decoration: BoxDecoration(
            color: ColorManager.colorPrimary.withOpacity(.30),
            borderRadius: BorderRadius.circular(20.r)
          ),
          child: Padding(
            padding:  EdgeInsets.only(top: 10.h,left: 14.w,right: 39.w),
            child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipisc"
            "ing elit, sed do eiusmod tempor incididunt ut labore et dolore m"
    "agna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
    "aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit ",
              style: TextStyleManager.textStyle16w500,
            ),
          ),
        ),
      ],
    );
  }
}

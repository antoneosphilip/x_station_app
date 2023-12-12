import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';

class Upload extends StatelessWidget {
  const Upload({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 9, top: 24),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: ColorManager.colorXWhite,
            ),
            width: 160.994.w,
              height: 196.633.h,
            child:  Center(
              child: Text(TextManager.uploadHere,style: TextStyleManager.textStyle20w700,),
            ),
          )
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 44.h,
              ),
              Text(
                TextManager.AbanoubMaged,
                style: TextStyleManager.textStyle20600White,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                TextManager.Twentyone,
                style: TextStyleManager.textStyle20600White,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                TextManager.Hourlyrate,
                style: TextStyleManager.textStyle20600White,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                TextManager.Rate,
                style: TextStyleManager.textStyle20600White,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 137,
                ),
                child: Text(
                  '4.5',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

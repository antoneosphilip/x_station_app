import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/screens/everent/custom_ratting_bar/custom_rating_bar.dart';

class Upload extends StatelessWidget {
final  String name;
final  num rate;
final  String price;
final bool isTech;
final  String image;

  const Upload({super.key, required this.name, required this.rate, required this.price,  this.isTech=true, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 9.w, top: 40,right: 9.w),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: ColorManager.colorXWhite,
              image:  DecorationImage(image: NetworkImage(image!),fit: BoxFit.cover)
            ),
            width: 140.994.w,
              height: 190.633.h,
          )
        ),
        Padding(
          padding:  EdgeInsets.only(left: 11.w,right: 11.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 44.h,
              ),
              Text(
                name,
                style: TextStyleManager.textStyle20600White.copyWith(fontSize: 19.sp),
              ),

              SizedBox(
                height: 20.h,
              ),
              isTech?  Text(
             '$price \$',
                style: TextStyleManager.textStyle20600White.copyWith(fontSize: 19.sp),
              ):const SizedBox(),
               SizedBox(height: 20.h,),
            Row(
                children: [
                  CustomRattingBar(color: ColorManager.colorWhite,size: 17,initRate: rate),
                  SizedBox(width: 16.w,),
                   Text(
                    '$rate',
                    style:  TextStyle(
                        fontSize: 19.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

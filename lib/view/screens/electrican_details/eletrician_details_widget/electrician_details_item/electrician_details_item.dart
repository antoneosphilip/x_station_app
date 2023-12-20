import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/view/screens/electrician_information/electrician_information_screen/electrician_information_Screen.dart';
import 'package:x_station_app/view/screens/everent/custom_ratting_bar/custom_rating_bar.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/style_font_manager/style_manager.dart';

class ElectricianDetailsItem extends StatelessWidget {
  final String name;
  final int rate;
  final String image;
  final String price;
  final  String email;
  final  String phone;
  final  String address;


  const ElectricianDetailsItem({super.key, required this.name, required this.rate, required this.image, required this.price, required this.email, required this.phone, required this.address});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to( ElectricianInformationScreen(
          phone: phone,
          email: email,
          address: address,
          rate: rate,
          name: name,
          price: price,
        ),
          duration: const Duration(
          milliseconds: 250,
        ),
          transition: Transition.downToUp,
        );
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Container(
          width: 340.w,
          height: 100.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: ColorManager.colorWhite
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
                    child: Container(
                      width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          image: const DecorationImage(image: NetworkImage('https://i.stack.imgur.com/l60Hf.png'),fit: BoxFit.cover)
                        ),

                    )
                ),
                SizedBox(width: 16.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${name}",style: TextStyleManager.textStyle14w500.copyWith(color: ColorManager.colorLightBlack,fontWeight: FontWeight.w400),),
                    SizedBox(height: 10.h,),
                    Text("15 \$",style: TextStyleManager.textStyle14w500.copyWith(color: ColorManager.colorDarkBlue),),
                    SizedBox(height: 8.h,),
                    Row(
                      children: [
                         CustomRattingBar(size: 17,initRate: rate),
                        SizedBox(width: 5.w,),
                        Text("${rate}",style: TextStyleManager.textStyle14w500.copyWith(color: ColorManager.colorLightBlack),),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding:  EdgeInsets.only(bottom: 57.14.h),
                  child: SvgPicture.asset(AssetsImage.heart2,color: ColorManager.colorPrimary,width: 30),
                ),
                SizedBox(width: 10.2.w,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

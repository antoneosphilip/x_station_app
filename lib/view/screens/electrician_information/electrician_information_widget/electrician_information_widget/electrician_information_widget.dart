import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/view/screens/electrician_information/electrician_information_widget/electrician_information_form/electrician_information_form.dart';

import '../electrician_information_form/upload.dart';

class ElectricianInformationWidget extends StatelessWidget {
  final  String name;
  final  num rate;
  final  String price;
  final  String email;
  final  String phone;
  final  String address;

  const ElectricianInformationWidget({super.key, required this.name, required this.rate, required this.price, required this.email, required this.phone, required this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(37),
            color: const Color(0Xff63628C),
          ),
          child: SizedBox(
            height: 340.h,
            width: 360.w,
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      child: Padding(
                        padding:  EdgeInsets.only(left: 18.w, top: 19.h,right: 18.w),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: SvgPicture.asset(
                            AssetsImage.arrowLeft,
                            color: ColorManager.colorPrimary,
                            width: 6.w,
                            height: 12.h,
                          ),
                        ),
                      ),
                      onTap: (){
                        Get.back();
                      },
                    ),
                    const Spacer(),
                    Padding(
                      padding:  EdgeInsets.only(right: 21.w, top: 27.h,left: 21.w),
                      child: SvgPicture.asset(
                        AssetsImage.heart2,
                        width: 43.w,
                        height: 36.h,
                      ),
                    ),
                  ],
                ),
                 Upload(
                   rate: rate,
                   name: name,
                    price: price,
                 )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
         ElectricianInformationForm(
           address: address,
         phone: phone,
           email: email,
         ),
      ],
    );
  }
}

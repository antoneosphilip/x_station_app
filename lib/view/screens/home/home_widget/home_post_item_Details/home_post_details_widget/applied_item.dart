

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/xstation_button_custom/x_station_button_custom.dart';

import '../../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../core_widget/elevated_button/elevated_button_custom.dart';
import '../../../../electrician_information/electrician_information_screen/electrician_information_Screen.dart';

class AppliedItem extends StatelessWidget {
  final String namePerson;
  final String emailPerson;
  final String address;
  final String phone;

  const AppliedItem({super.key, required this.namePerson, required this.emailPerson, required this.address, required this.phone});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(ElectricianInformationScreen(
          name: namePerson,
          address: address,
          phone: phone,
          email: emailPerson,
          price: '30 \$',
          rate: 4,
        ));
      },
      child: Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.w),
        child: Container(
          width: 358.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.grey),
            color: Colors.white,
          ),
          child: Row(
            children: [
              SizedBox(width: 16.w,),
              Padding(
                padding:  EdgeInsets.only(top: 12.h,bottom: 12.h),
                child: const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.Z5BlhFYs_ga1fZnBWkcKjQHaHz?rs=1&pid=ImgDetMain")
                ),
              ),
              SizedBox(width: 7.w,),
              Padding(
                padding:  EdgeInsets.only(top: 15.h,bottom: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${namePerson}",style: TextStyleManager.textStyle14w500),
                    SizedBox(height: 4.h,),
                    Text("${emailPerson}",style: TextStyleManager.textStyle14w500),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

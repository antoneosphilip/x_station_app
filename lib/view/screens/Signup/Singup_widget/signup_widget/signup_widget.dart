import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/text_form_field/text_form_field_custom.dart';
import 'package:x_station_app/view/screens/Signup/Singup_widget/signup_form/Signup_form.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 4.h,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 67.w, top: 11.h),
                child: SvgPicture.asset(
                  AssetsImage.signUpIcon,
                  width: 298.w,
                  height: 251.h,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:  const EdgeInsets.only(bottom: 25),
                child: Text(
                  TextManager.getstarted.tr,
                  style: TextStyleManager.textStyle36w500,
                ),
              ),
              Text(
                TextManager.creataccount.tr,
                style: TextStyleManager.textStyle14w300,
              ),
            ],
          ),
          SizedBox(
            height: 17.h,
          ),
           SinupForm(),
        ],
      ),
    );
  }
}

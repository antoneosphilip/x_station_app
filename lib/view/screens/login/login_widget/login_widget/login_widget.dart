import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/text_form_field/text_form_field_custom.dart';
import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../view_model/block/profile_cubit/profile_cubit.dart';
import '../login_form/login_form.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 32.h,
          ),
          Image.asset(
            AssetsImage.loginImage,
            width: 306.w,
            height: 250.h,
            fit: BoxFit.cover,
          ),
          Text(
            TextManager.welcomeBack.tr,
            style: TextStyleManager.textStyle24w500.copyWith(color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary,),
          ),
          SizedBox(
            height: 13.h,
          ),
          Text(
            TextManager.signItToAccess.tr,
            style: TextStyleManager.textStyle14w300.copyWith(color:ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary ),
          ),
          SizedBox(
            height: 13.h,
          ),
          const LoginForm(),
        ],
      ),
    );
  }
}

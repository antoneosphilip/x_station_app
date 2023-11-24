import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';

import '../../../../core/assets_manager/assets_manager.dart';
import '../../../../core/regexp.dart';
import '../../../../core/style_font_manager/style_manager.dart';
import '../../../../core/text_manager/text_manager.dart';
import '../../../core_widget/text_form_field/text_form_field_custom.dart';
import '../../../core_widget/xstation_button_custom/x_station_button_custom.dart';


class ForgetPasswordWidget extends StatelessWidget {
   ForgetPasswordWidget({
    super.key,
  });
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.only(left: 24.w,right: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         SizedBox(height: 94.h,),
          Text(TextManager.forgetPassword2,style: TextStyleManager.textStyle24w500),
          SizedBox(height: 170.h,),
          Center(child: Text(TextManager.dontWory,style: TextStyleManager.textStyle14w500.copyWith(color: ColorManager.colorPrimary))),
          SizedBox(height: 32.h,),
          TextFormFieldCustom(
            keyboardType: TextInputType.emailAddress,
            validate: (value) {},
            label: TextManager.enterYourEmail,
            suffix: true,
            suffixIcon: SvgPicture.asset(AssetsImage.email),
          ),
          SizedBox(height: 32.h,),
           Center(child: XStationButtonCustom(textButton: TextManager.continuee,pageName: PageName.verification,onPressed: (){
             Get.toNamed(PageName.verification);
           },)),
          SizedBox(
            height: 40.h,
          ),
          // text Form
        ],
      ),
    );
  }
}
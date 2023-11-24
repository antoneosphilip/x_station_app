import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../core/text_manager/text_manager.dart';
import '../../../../core_widget/elevated_button/elevated_button_custom.dart';
import '../../../../core_widget/text_form_field/text_form_field_custom.dart';
import '../../../../core_widget/xstation_button_custom/x_station_button_custom.dart';
import '../check_box/check_box.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          TextFormFieldCustom(
            keyboardType: TextInputType.emailAddress,
            validate: (value) {},
            label: TextManager.enterYourEmail,
            suffix: true,
            suffixIcon: SvgPicture.asset(AssetsImage.email),
          ),
          SizedBox(
            height: 25.h,
          ),
          TextFormFieldCustom(
            keyboardType: TextInputType.visiblePassword,
            validate: (value) {},
            label: TextManager.password,
            suffix: true,
            suffixIcon: SvgPicture.asset(AssetsImage.password),
          ),
          SizedBox(
            height: 16.h,
          ),
          const CheckBoxWidget(),
          SizedBox(
            height: 150.h,
          ),
          
           XStationButtonCustom(textButton: TextManager.next, onPressed: (){
             Get.toNamed(PageName.homeLayout);
           },),
          SizedBox(
            height: 23.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                TextManager.newMember,
                style: TextStyleManager.textStyle12w400
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 3.w,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(PageName.register);
                },
                child: Text(
                  TextManager.registerNow,
                  style: TextStyleManager.textStyle12w400.copyWith(
                      fontWeight: FontWeight.w700,
                      color: ColorManager.colorPrimary),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 59.h,
          ),

        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/view/screens/home_technical/home_technical_screen/home_technical_screen.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/route_manager/page_name.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../core/text_manager/text_manager.dart';
import '../../../../core_widget/text_form_field/text_form_field_custom.dart';
import '../../../../core_widget/xstation_button_custom/x_station_button_custom.dart';
import '../check_box_sin/checkbox_sign.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../technical_types/technical_types.dart';


class SignUpTextFormField extends StatefulWidget {
final String value;

   SignUpTextFormField({super.key, required this.value});

  @override
  State<SignUpTextFormField> createState() => _SignUpTextFormFieldState();
}

class _SignUpTextFormFieldState extends State<SignUpTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h,),
        TextFormFieldCustom(
          keyboardType: TextInputType.name,
          validate: (value) {},
          label: TextManager.fullName,
          suffix: true,
          suffixIcon: SvgPicture.asset(AssetsImage.user),
        ),
        SizedBox(
          height: 19.h,
        ),
        TextFormFieldCustom(
          keyboardType: TextInputType.emailAddress,
          validate: (value) {},
          label: TextManager.validemail,
          suffix: true,
          suffixIcon: SvgPicture.asset(AssetsImage.email),
        ),
        SizedBox(
          height: 19.h,
        ),
        TextFormFieldCustom(
          keyboardType: TextInputType.phone,
          validate: (value) {},
          label: TextManager.phonenumber,
          suffix: true,
          suffixIcon: SvgPicture.asset(AssetsImage.phonenumber),
        ),
        SizedBox(
          height: 19.h,
        ),
        TextFormFieldCustom(
          keyboardType: TextInputType.text,
          validate: (value) {},
          label: TextManager.password,
          suffix: true,
          suffixIcon: SvgPicture.asset(AssetsImage.lock),
        ),
        SizedBox(
          height: 19.h,
        ),
        TextFormFieldCustom(
          keyboardType: TextInputType.phone,
          validate: (value) {},
          label: TextManager.rePassword,
          suffix: true,
          suffixIcon: SvgPicture.asset(AssetsImage.lock),
        ),
      widget.value!=TextManager.client?
        Padding(
          padding:  EdgeInsets.only(top: 19.h),
          child: TechnicalTypes(),
        ):const SizedBox(),
        SizedBox(
          height: 29.h,
        ),

        const CheckBoxSignup(),
        SizedBox(
          height: 21.h,
        ),
         XStationButtonCustom(textButton: TextManager.continuee, onPressed: (){
           Get.toNamed(PageName.homeLayout);

         },),
        SizedBox(
          height: 25.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              TextManager.alreadymember,
              style: TextStyleManager.textStyle12w400
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 3.w,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(PageName.login);
              },
              child: Text(
                TextManager.login,
                style: TextStyleManager.textStyle12w400.copyWith(
                    fontWeight: FontWeight.w700,
                    color: ColorManager.colorPrimary),
              ),
            ),
            SizedBox(height: 42.h,)
          ],
        ),
      ],
    );
  }
}

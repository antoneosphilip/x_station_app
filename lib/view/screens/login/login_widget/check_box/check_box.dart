import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';

import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../core/text_manager/text_manager.dart';
import '../../../../../view_model/block/profile_cubit/profile_cubit.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxWidget> {
  bool valueCheckBox=true;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Checkbox(
          activeColor: ColorManager.colorPrimary,
          splashRadius: Checkbox.width,
          value: valueCheckBox,
          onChanged: (value) {
            setState(() {
              valueCheckBox=value!;
            });
          },
        ),
        Text(TextManager.rememberMe.tr,
            style: TextStyleManager.textStyle12w400.copyWith(color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary)),
        const Spacer(),
       
         InkWell(
                onTap: () {
                  Get.toNamed(PageName.forgetPassword);
                },
                child:  Text(
            TextManager.forgetPassword.tr,
            style: TextStyleManager.textStyle12w400.copyWith(color:ColorManager.colorThird)
        ),
              ),
        ]
        ,
    );
  }
}

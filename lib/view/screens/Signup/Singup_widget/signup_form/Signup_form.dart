import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/text_form_field/text_form_field_custom.dart';
import 'package:x_station_app/view/core_widget/xstation_button_custom/x_station_button_custom.dart';
import 'package:x_station_app/view/screens/Signup/Singup_widget/check_box_sin/checkbox_sign.dart';
import 'package:x_station_app/view/screens/login/login_widget/check_box/check_box.dart';
import 'package:x_station_app/view_model/block/home_layout_cubit/home_layoout_cubit.dart';

import '../../../../../core/service_locator/service_locator.dart';
import '../../../../../view_model/block/profile_cubit/profile_cubit.dart';
import '../../../../../view_model/block/signup_cubit/signup_cubit.dart';
import '../../../../../view_model/repo/signup_repo/sigup_repo.dart';
import '../sign_up_textformfield/sign_up_textform_field.dart';

class SinupForm extends StatefulWidget {

  @override
  State<SinupForm> createState() => _SinupFormState();
}

class _SinupFormState extends State<SinupForm> {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
      children: [
        Row(
      children: [
        Expanded(
          child: RadioListTile(
            title:  Text(TextManager.client.tr,style: TextStyle(color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary),),

            contentPadding: EdgeInsets.zero,
            activeColor: ColorManager.colorPrimary,
            value: TextManager.client,
            groupValue: HomeLayoutCubit.get(context).selectedValue,
            onChanged: (value) {
              setState(() {
                HomeLayoutCubit.get(context).selectedValue=value!;
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            title:  Text(TextManager.technical.tr,style: TextStyle(color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary),),
            contentPadding: EdgeInsets.zero,
            activeColor: ColorManager.colorPrimary,
            value: TextManager.technical,
            groupValue: HomeLayoutCubit.get(context).selectedValue,
            onChanged: (value) {
              setState(() {
                HomeLayoutCubit.get(context).selectedValue=value!;
              });
            },
          ),
        ),
        // Expanded(
        //   child: RadioListTile(
        //     title: const Text(TextManager.company),
        //     contentPadding: EdgeInsets.zero,
        //     activeColor: ColorManager.colorPrimary,
        //     value: TextManager.company,
        //     groupValue: HomeLayoutCubit.get(context).selectedValue,
        //     onChanged: (value) {
        //       setState(() {
        //         HomeLayoutCubit.get(context).selectedValue=value!;
        //       });
        //     },
        //   ),
        // ),
      ],
    ),
        SignUpTextFormField( value: HomeLayoutCubit.get(context).selectedValue!,),

        ]),
      );
  }
}

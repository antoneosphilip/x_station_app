
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/custom_circle_loading/custom_circle_loading.dart';
import 'package:x_station_app/view/core_widget/flutter_toast/flutter_toast.dart';
import 'package:x_station_app/view/core_widget/xstation_button_custom/pinput_custom.dart';
// import 'package:pinput/pinput.dart';
import 'package:x_station_app/view/core_widget/xstation_button_custom/x_station_button_custom.dart';
import 'package:x_station_app/view_model/block/forget_password_cubit/forget_password_cubit.dart';
import 'package:x_station_app/view_model/block/forget_password_cubit/forget_password_states.dart';

import '../../../../view_model/block/profile_cubit/profile_cubit.dart';


class VerificationWidget extends StatefulWidget {

  @override
  State<VerificationWidget> createState() => _VerificationWidgetState();

}

class _VerificationWidgetState extends State<VerificationWidget> {

  int ?resendTime;

  late Timer countdownTimer;
  void startTimer(){
    resendTime=60;
    countdownTimer=Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendTime !> 0) {
        setState(() {
          resendTime = resendTime! - 1;
        });
      }
      if (resendTime! < 1) {
        setState(() {
          countdownTimer.cancel();
        });
      }
    });
  }
  @override
  void initState() {
    super.initState();
    startTimer();
  }
  @override
  void dispose() {
    countdownTimer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(padding: EdgeInsets.only(top: 94.h  , left: 21.w , right: 180.w),
          child:
          Text(TextManager.almostThere.tr,style: TextStyleManager.textStyle24w500.copyWith(
            color:    ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary

          )),
        ),
        Padding(padding: EdgeInsets.only(top: 26.h  , left: 22.w , right: 14.w),
          child:
          Text.rich(
              TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: TextManager.pleaseEnter.tr,
                      style: TextStyleManager.textStyle14w300.copyWith(
                        color:
                        ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary

                        ),
                    ),
                    TextSpan(
                      text: ForgetPasswordCubit.get(context).emailController.text.tr,
                      style: TextStyleManager.textStyle14w700.copyWith(
                        color:
                        ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary
    ),
                    ),
                    TextSpan(
                      text: TextManager.forVerification.tr,
                      style: TextStyleManager.textStyle14w300.copyWith(
                        color:
                        ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary

    ),
                    ),

                  ]
              )
          ),
        ),
        const PinPutWidget(),

        XStationButtonCustom(
          textButton: TextManager.verify, onPressed: (){
          if(ForgetPasswordCubit.get(context).formKey.currentState!.validate()){
            Get.toNamed(PageName.resetPassword);
          }
        },),
        Padding(padding: EdgeInsets.only(top: 62.h , left: 57.w , right: 33.w ),
          child:
          resendTime==0? Row(children: [
            Text(TextManager.didntReceive.tr, style: TextStyleManager.textStyle14w700.copyWith(
              color:    ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary

          )),
            SizedBox(width:11.w),
            InkWell(
                onTap: (){
                  startTimer();
                  ForgetPasswordCubit.get(context).forgetPassword();
                },
                child: Text(TextManager.resendAgain.tr ,style: TextStyleManager.textStyle14w700.copyWith(color: ColorManager.colorPrimary)))
          ],):const SizedBox(),
        ),

        SizedBox(height: 4.h),
        resendTime!=0?
        Text('${TextManager.requestNew.tr+resendTime.toString()} s'.tr , style: TextStyleManager.textStyle12w400):
        const SizedBox(),
        Padding(
          padding: EdgeInsets.only(top: 257.h, left: 19.w  ,right: 290.w),
          child: FloatingActionButton(
            onPressed: (){
                Get.back();
              },
            backgroundColor: ColorManager.colorPrimary,
            child: SvgPicture.asset(AssetsImage.arrowLeft),
              )
        ),
        SizedBox(height: 35.65.h,)
      ],
    );
  }
}
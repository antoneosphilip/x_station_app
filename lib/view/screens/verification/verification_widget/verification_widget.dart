
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/xstation_button_custom/pinput_custom.dart';
// import 'package:pinput/pinput.dart';
import 'package:x_station_app/view/core_widget/xstation_button_custom/x_station_button_custom.dart';


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
          Text(TextManager.almostThere,style: TextStyleManager.textStyle24w500),
        ),
        Padding(padding: EdgeInsets.only(top: 26.h  , left: 22.w , right: 14.w),
          child:
          Text.rich(
              TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: TextManager.pleaseEnter,
                      style: TextStyleManager.textStyle14w300,
                    ),
                    TextSpan(
                      text: TextManager.email,
                      style: TextStyleManager.textStyle14w700,
                    ),
                    TextSpan(
                      text: TextManager.forVerification,
                      style: TextStyleManager.textStyle14w300,
                    ),

                  ]
              )
          ),
        ),
        const PinPutWidget(),

        Padding(padding: EdgeInsets.symmetric(horizontal: 33.w),
          child:
          XStationButtonCustom(textButton: TextManager.verify, onPressed: (){
            Get.toNamed(PageName.resetPassword);
          },),
        ),

        Padding(padding: EdgeInsets.only(top: 62.h , left: 57.w , right: 33.w ),
          child:
          resendTime==0? Row(children: [
            Text(TextManager.didntReceive, style: TextStyleManager.textStyle14w700),
            SizedBox(width:11.w),
            InkWell(
                onTap: (){
                  startTimer();
                },
                child: Text(TextManager.resendAgain ,style: TextStyleManager.textStyle14w700.copyWith(color: ColorManager.colorPrimary)))
          ],):const SizedBox(),
        ),

        SizedBox(height: 4.h),
        resendTime!=0?
        Text('${TextManager.requestNew+resendTime.toString()}s' , style: TextStyleManager.textStyle12w400):
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
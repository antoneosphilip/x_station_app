
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
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
import 'package:x_station_app/view/screens/verification_email/verification_widget/pin_code_verify_email.dart';
import 'package:x_station_app/view_model/block/forget_password_cubit/forget_password_cubit.dart';
import 'package:x_station_app/view_model/block/forget_password_cubit/forget_password_states.dart';
import 'package:x_station_app/view_model/block/signup_cubit/signup_cubit.dart';
import 'package:x_station_app/view_model/block/signup_cubit/signup_states.dart';


class VerificationEmailWidget extends StatefulWidget {

  @override
  State<VerificationEmailWidget> createState() => _VerificationEmailWidgetState();

}

class _VerificationEmailWidgetState extends State<VerificationEmailWidget> {

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
    return  BlocConsumer<SignUpCubit,SignUpStates>(
      listener: (context,state){
        if(state is SendCodeSuccessState){
          showFlutterToast(message: state.loginModel.message, state: ToastState.SUCCESS);
        }
        else if(state is SendCodeErrorState){
          showFlutterToast(message: state.err, state: ToastState.ERROR);
        }
      },
      builder: (context,state){
        return Column(
          children: [

            Padding(padding: EdgeInsets.only(top: 94.h  , left: 21.w , right: 180.w),
              child:
              Text(TextManager.almostThere.tr,style: TextStyleManager.textStyle24w500),
            ),
            Padding(padding: EdgeInsets.only(top: 26.h  , left: 22.w , right: 14.w),
              child:
              Text.rich(
                  TextSpan(
                      children: <InlineSpan>[
                        TextSpan(
                          text: TextManager.pleaseEnter.tr,
                          style: TextStyleManager.textStyle14w300,
                        ),
                        TextSpan(
                          text: SignUpCubit.get(context).emailController.text.tr,
                          style: TextStyleManager.textStyle14w700,
                        ),
                        TextSpan(
                          text: TextManager.forVerification.tr,
                          style: TextStyleManager.textStyle14w300,
                        ),

                      ]
                  )
              ),
            ),
            const PinPutVerifyEmailWidget(),

            BlocConsumer<SignUpCubit,SignUpStates>(
              listener: (context,state){
                if(state is VerifyEmailSuccessState){
                  showFlutterToast(message: state.verifyEmailModel.message, state: ToastState.SUCCESS);
                  Get.toNamed(PageName.login);
                }
                else if(state is VerifyEmailErrorState){
                  if(state.err=="Your Request Not Found Try Again Later"){
                    showFlutterToast(message: "Expired Or Invalid Code".tr, state: ToastState.ERROR);
                  }
                  else{
                    showFlutterToast(message: state.err, state: ToastState.ERROR);
                  }
                }

              },
              builder: (context,state){
                return state is VerifyEmailLoadingState?
                const CustomCircleLoading():
                XStationButtonCustom(
                  textButton: TextManager.verify, onPressed: (){
                    SignUpCubit.get(context).verifyEmail();

                },);
              },
            ),
            Padding(padding: EdgeInsets.only(top: 62.h , left: 57.w , right: 33.w ),
              child:
              resendTime==0? Row(children: [
                Text(TextManager.didntReceive.tr, style: TextStyleManager.textStyle14w700),
                SizedBox(width:11.w),
                InkWell(
                    onTap: (){
                      startTimer();
                      SignUpCubit.get(context).sendCode();
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
      },
    );
  }
}
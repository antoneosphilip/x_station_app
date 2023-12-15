import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/view/core_widget/custom_circle_loading/custom_circle_loading.dart';
import 'package:x_station_app/view/core_widget/flutter_toast/flutter_toast.dart';
import 'package:x_station_app/view_model/block/forget_password_cubit/forget_password_cubit.dart';
import 'package:x_station_app/view_model/block/forget_password_cubit/forget_password_states.dart';

import '../../../../core/assets_manager/assets_manager.dart';
import '../../../../core/regexp.dart';
import '../../../../core/style_font_manager/style_manager.dart';
import '../../../../core/text_manager/text_manager.dart';
import '../../../core_widget/text_form_field/text_form_field_custom.dart';
import '../../../core_widget/xstation_button_custom/x_station_button_custom.dart';


class ResetPasswordWidget extends StatelessWidget {
   ResetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Form(
      key: ForgetPasswordCubit.get(context).formKeyResetPass,
      child: Padding(
        padding:  EdgeInsets.only(left: 24.w,right: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           SizedBox(height: 94.h,),
            Text(TextManager.resetPassword,style: TextStyleManager.textStyle24w500),
            SizedBox(height: 170.h,),
            TextFormFieldCustom(
              controller: ForgetPasswordCubit.get(context).passwordController,
              keyboardType: TextInputType.text,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return TextManager.pleaseEnterPassword;
                }
                // else if (!Regexp.isValidPassword(value)) {
                //   return TextManager.invalidPass;
                // }
                return null;
              },
              label: TextManager.password,
              suffix: true,
              suffixIcon: SvgPicture.asset(AssetsImage.lock),
            ),
            SizedBox(height: 32.h,),
            TextFormFieldCustom(
              onEditingComplete: (){
                if(ForgetPasswordCubit.get(context).formKeyResetPass.currentState!.validate()){
                  ForgetPasswordCubit.get(context).resetPassword();
                }
              },
              controller: ForgetPasswordCubit.get(context).passwordConfirmationController,
              keyboardType: TextInputType.text,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return TextManager.pleaseEnterRePassword;
                }
                else if (value.length<6) {
                  return TextManager.invalidRePass;
                }
                return null;
              },
              label: TextManager.rePassword,
              suffix: true,
              suffixIcon: SvgPicture.asset(AssetsImage.lock),
            ),
            SizedBox(height: 32.h,),
             BlocConsumer<ForgetPasswordCubit,ForgetPasswordStates>(
               listener: (context,state){
                 if(state is ResetPasswordSuccessState){
                   showFlutterToast(message: state.forgetPasswordModel.message, state: ToastState.SUCCESS);
                   Get.offAndToNamed(PageName.login);
                 }
                 if(state is ResetPasswordErrorState){
                   if(state.err=="Your Request Not Found Try Again Later"){
                     showFlutterToast(message: "Expired Or Invalid Code", state: ToastState.ERROR);
                   }
                   else{
                     showFlutterToast(message: state.err, state: ToastState.ERROR);
                   }

                 }
               },
               builder: (context,state){
                 return state is ResetPasswordLoadingState?
                     const CustomCircleLoading():
                 Center(child: XStationButtonCustom(
                   textButton: TextManager.confirm,
                   onPressed: (){
                     if(ForgetPasswordCubit.get(context).formKeyResetPass.currentState!.validate()){
                       ForgetPasswordCubit.get(context).resetPassword();
                     }
                   },));
               },
             ),
            SizedBox(
              height: 40.h,
            ),
            // text Form
          ],
        ),
      ),
    );
  }
}
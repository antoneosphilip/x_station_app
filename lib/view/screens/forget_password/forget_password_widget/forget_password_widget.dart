import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/view/core_widget/custom_circle_loading/custom_circle_loading.dart';
import 'package:x_station_app/view/core_widget/custom_top_snack/custom_top_snack.dart';
import 'package:x_station_app/view/core_widget/flutter_toast/flutter_toast.dart';
import 'package:x_station_app/view_model/block/forget_password_cubit/forget_password_cubit.dart';
import 'package:x_station_app/view_model/block/forget_password_cubit/forget_password_states.dart';

import '../../../../core/assets_manager/assets_manager.dart';
import '../../../../core/regexp.dart';
import '../../../../core/style_font_manager/style_manager.dart';
import '../../../../core/text_manager/text_manager.dart';
import '../../../../view_model/block/profile_cubit/profile_cubit.dart';
import '../../../core_widget/snack_bar_custom/snack_bar_custom.dart';
import '../../../core_widget/text_form_field/text_form_field_custom.dart';
import '../../../core_widget/xstation_button_custom/x_station_button_custom.dart';


class ForgetPasswordWidget extends StatelessWidget {
   ForgetPasswordWidget({
    super.key,
  });
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return Form(
      key: ForgetPasswordCubit.get(context).formKey,
      child: Padding(
        padding:  EdgeInsets.only(left: 24.w,right: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           SizedBox(height: 94.h,),
            Text(TextManager.forgetPassword2.tr,style: TextStyleManager.textStyle24w500.copyWith(color:
            ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary
            )),
            SizedBox(height: 170.h,),
            Center(child: Text(TextManager.dontWory.tr,style: TextStyleManager.textStyle14w500.copyWith(color: ColorManager.colorPrimary))),
            SizedBox(height: 32.h,),
            TextFormFieldCustom(
              controller: ForgetPasswordCubit.get(context).emailController,
              keyboardType: TextInputType.emailAddress,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return TextManager.pleaseEnterEmail;
                }
                else if (!Regexp.isValidEmail(value)) {
                  return TextManager.invalidEmail;
                }
                return null;
              },
              label: TextManager.enterYourEmail.tr,
              suffix: true,
              suffixIcon: SvgPicture.asset(AssetsImage.email),
            ),
            SizedBox(height: 32.h,),
             BlocConsumer<ForgetPasswordCubit,ForgetPasswordStates>(
               listener: (context,state){
                 if(state is ForgetPasswordSuccessState){
                   Get.toNamed(PageName.verification);
                   showFlutterToast(message: state.forgetPasswordModel.message, state: ToastState.SUCCESS);
                 }
                 else if(state is ForgetPasswordErrorState){
                   showFlutterToast(message: state.err, state: ToastState.ERROR);

                 }
               },
               builder: (context,state){
                 return state is ForgetPasswordLoadingState?
                     const CustomCircleLoading():
                 Center(
                     child: XStationButtonCustom(
                   textButton: TextManager.continuee,
                   onPressed: (){
                     if(ForgetPasswordCubit.get(context).formKey.currentState!.validate()){
                       ForgetPasswordCubit.get(context).forgetPassword();
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/view_model/block/forget_password_cubit/forget_password_cubit.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_cubit.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_states.dart';
import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/regexp.dart';
import '../../../../../core/service_locator/service_locator.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../core/text_manager/text_manager.dart';
import '../../../../../view_model/repo/login_repo/login_repo.dart';
import '../../../../core_widget/custom_circle_loading/custom_circle_loading.dart';
import '../../../../core_widget/custom_top_snack/custom_top_snack.dart';
import '../../../../core_widget/elevated_button/elevated_button_custom.dart';
import '../../../../core_widget/text_form_field/text_form_field_custom.dart';
import '../../../../core_widget/xstation_button_custom/x_station_button_custom.dart';
import '../check_box/check_box.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});
  //(sl.get<LoginRepoImpl>())
  //       create: (BuildContext context) =>LoginCubit((sl.get<LoginRepoImpl>())),
  @override
  Widget build(BuildContext context) {
    return Form(
      key: LoginCubit.get(context).formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            TextFormFieldCustom(
              controller: LoginCubit.get(context).emailController,
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
              label: TextManager.enterYourEmail,
              suffix: true,
              suffixIcon: SvgPicture.asset(AssetsImage.email),
            ),
            SizedBox(
              height: 25.h,
            ),
            TextFormFieldCustom(
              // controller: LoginCubit.get(context).passwordController,
              keyboardType: TextInputType.visiblePassword,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return TextManager.pleaseEnterPassword;
                }    else if (!Regexp.isValidPassword(value)) {
                  return TextManager.invalidPass;
                 }
                return null;
              },
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
             BlocConsumer<LoginCubit,LoginStates>(
               listener: (context,state){
                 if(state is LoginSuccessState) {
                   Get.offAndToNamed(PageName.homeLayout);
                 }
                   else if(state is LoginErrorState){
                   // CustomTopSnackBar(
                   //     message: state.err!,
                   //     snackBarType: SnackBarType.error,
                   //     );
                 }
               },
               builder: (context,state){
                 return state is LoginLoadingState?
                 const CustomCircleLoading():
                 XStationButtonCustom(
                   textButton: TextManager.next, onPressed: (){
                   Get.offAndToNamed(PageName.homeLayout);

                   if(LoginCubit.get(context).formKey.currentState!.validate()){
                       // LoginCubit.get(context).login();
                     }
                 },);
               },
             ),
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
      ),
    );
  }
}

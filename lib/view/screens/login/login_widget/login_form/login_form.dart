import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/view/notification_module/presentation/manager/notification_cubit/notification_cubit.dart';
import 'package:x_station_app/view_model/block/category_cubit/category_cubit.dart';
import 'package:x_station_app/view_model/block/forget_password_cubit/forget_password_cubit.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_cubit.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_states.dart';
import 'package:x_station_app/view_model/block/posts_cubit/posts_cubit.dart';
import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/regexp.dart';
import '../../../../../core/service_locator/service_locator.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../core/text_manager/text_manager.dart';
import '../../../../../view_model/block/profile_cubit/profile_cubit.dart';
import '../../../../../view_model/repo/login_repo/login_repo.dart';
import '../../../../core_widget/custom_circle_loading/custom_circle_loading.dart';
import '../../../../core_widget/custom_top_snack/custom_top_snack.dart';
import '../../../../core_widget/elevated_button/elevated_button_custom.dart';
import '../../../../core_widget/snack_bar_custom/snack_bar_custom.dart';
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
        child: BlocConsumer<LoginCubit,LoginStates>(
          listener: (context,state){
            if(state is LoginSuccessState) {
              Get.offAllNamed(PageName.homeLayout);
              customSnackBar(
                  message: state.loginModel.message.toString(),
                  snackBarType: SnackBarType.success,
                  context: context);
              PostsCubit.get(context).getPosts();
              CategoryCubit.get(context).getCategory();
              NotificationCubit.get(context).getNotification();
            }
            else if(state is LoginErrorState){
              customSnackBar(
                  message: state.err,
                  snackBarType: SnackBarType.error,
                  context: context);
            }
          },
          builder: (context,state){
            return Column(
              children: [
                TextFormFieldCustom(
                  controller: LoginCubit.get(context).emailController,
                  keyboardType: TextInputType.emailAddress,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return TextManager.pleaseEnterEmail.tr;
                    }
                    else if (!Regexp.isValidEmail(value)) {
                      return TextManager.invalidEmail.tr;
                    }
                    return null;
                  },
                  label: TextManager.enterYourEmail.tr,
                  suffix: true,
                  suffixIcon: SvgPicture.asset(AssetsImage.email),
                ),
                SizedBox(
                  height: 25.h,
                ),

                TextFormFieldCustom(

                  controller: LoginCubit.get(context).passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return TextManager.pleaseEnterPassword.tr;
                    }
                    // else if (!Regexp.isValidPassword(value)) {
                    //   return TextManager.invalidPass;
                    //  }
                    return null;
                  },
                  label: TextManager.password.tr,
                  suffix: true,
                  suffixIcon: LoginCubit.get(context).visibility?const Icon(Icons.visibility,color: ColorManager.colorPrimary,):Icon(Icons.visibility_off,color: ColorManager.colorPrimary,),
                  suffixOnPressed:(){
                    LoginCubit.get(context).changeVisibilityPassword();
                  } ,
                  obSecure: LoginCubit.get(context).visibility,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const CheckBoxWidget(),
                SizedBox(
                  height: 150.h,
                ),
                state is LoginLoadingState?
                const CustomCircleLoading():
                XStationButtonCustom(
                    textButton: TextManager.next, onPressed: (){
                  if(LoginCubit.get(context).formKey.currentState!.validate()){
                    LoginCubit.get(context).login();
                  }
                }
                ),
                SizedBox(
                  height: 23.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TextManager.newMember.tr,
                      style: TextStyleManager.textStyle12w400
                          .copyWith(fontWeight: FontWeight.w500,color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(PageName.register);
                      },
                      child: Text(
                        TextManager.registerNow.tr,
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
            );
          },
        ),
      ),
    );
  }
}

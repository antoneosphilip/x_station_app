import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:x_station_app/view_model/block/profile_cubit/profile_cubit.dart';


import '../../../../core/assets_manager/assets_manager.dart';
import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/text_manager/text_manager.dart';
import '../../../core_widget/text_form_field/text_form_field_custom.dart';


class UserDataCard extends StatelessWidget {
  const   UserDataCard({super.key});

  @override
  Widget build(BuildContext context) {

   ProfileCubit.get(context). nameController.text=ProfileCubit.get(context).profileModel!.data!.name!;
   ProfileCubit.get(context). emailController.text=ProfileCubit.get(context).profileModel!.data!.email!;
    ProfileCubit.get(context).phoneController.text=ProfileCubit.get(context).profileModel!.data!.phoneNumber!;
    ProfileCubit.get(context).addressController.text=ProfileCubit.get(context).profileModel!.data!.address!;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      width: MediaQuery.of(context).size.width,
      // height: ScreenUtil().setHeight(60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: ColorManager.colorWhite,
        boxShadow: const [
          BoxShadow(
              blurRadius: 2,
              color: ColorManager.colorGrey,
              offset: Offset(0, 0),
              spreadRadius: 1)
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormFieldCustom(
              controller:ProfileCubit.get(context). nameController,
              //label: 'errrrrrr',
              validate: (String? value) {
                if (value!.isEmpty) {
                  return 'Filed Required';
                }
                return null;
              },
              hint: TextManager.name.tr,

              boarderColor: ColorManager.colorPrimary,
              // suffixIcon: Padding(
              //   padding: EdgeInsets.all(8.sp),
              //   child: SvgPicture.asset(
              //     AssetsManager.EDIT,
              //     color: ColorManager.colorBlack,
              //   ),
              // ),
              // label: 'Name',
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              child: TextFormFieldCustom(
                controller: ProfileCubit.get(context).emailController,
                enable: true,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'Filed Required';
                  }
                  return null;
                },
                boarderColor: ColorManager.colorPrimary,
                suffixIcon: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: SvgPicture.asset(AssetsImage.loginImage),
                ),
                hint: TextManager.email.tr,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: TextFormFieldCustom(
                controller: ProfileCubit.get(context).phoneController,

                validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'Filed Required';
                  }
                  return null;
                },
                boarderColor: ColorManager.colorPrimary,
                suffixIcon: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: SvgPicture.asset(AssetsImage.signUpIcon),
                ),
                hint: TextManager.phonenumber.tr,
                keyboardType: TextInputType.phone,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: TextFormFieldCustom(
                controller: ProfileCubit.get(context).addressController,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'Filed Required';
                  }
                  return null;
                },
                boarderColor: ColorManager.colorPrimary,
                suffixIcon: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: SvgPicture.asset(AssetsImage.signUpIcon),
                ),
                hint: TextManager.address.tr,
                keyboardType: TextInputType.streetAddress,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

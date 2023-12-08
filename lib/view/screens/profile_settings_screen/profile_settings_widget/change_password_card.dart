import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/regexp.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/style_font_manager/style_manager.dart';
import '../../../../core/text_manager/text_manager.dart';
import '../../../core_widget/elevated_button/elevated_button_custom.dart';
import '../../../core_widget/text_form_field/text_form_field_custom.dart';


class ChangePasswordCard extends StatelessWidget {
  ChangePasswordCard({super.key});

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController currentPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _key,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
        child: Container(
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40.sp),
            child: ExpansionTile(
              backgroundColor: ColorManager.colorWhite,
              expandedAlignment: Alignment.centerLeft,
              iconColor: ColorManager.colorPrimary,
              childrenPadding:
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
              collapsedIconColor: ColorManager.colorPrimary,
              collapsedBackgroundColor: ColorManager.colorWhite,
              title: Row(
                children: [
                  Text(
                    TextManager.changePassword.tr,
                    style: TextStyleManager.textStyle16w500,
                  ),
                ],
              ),
              children: [
                TextFormFieldCustom(
                  controller: currentPassword,
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    } else if (!Regexp.isValidPassword(value)) {
                      return 'Password must contain at least one lowercase letter, one uppercase, and one special character (@, #, ., \$, &, *)';
                    }
                    return null;
                  },
                  label: TextManager.currentPassword.tr,
                  suffix: true,
                  inputTextColor: ColorManager.colorBlack,

                  boarderColor: ColorManager.colorPrimary,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: TextFormFieldCustom(
                    controller: newPassword,
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm password can't be empty";
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      } else if (!Regexp.isValidPassword(value)) {
                        return 'Password must contain at least one lowercase letter, one uppercase, and one special character (@, #, ., \$, &, *)';
                      }
                      return null;
                    },
                    label: TextManager.newPassword.tr,
                    suffix: true,
                    inputTextColor: ColorManager.colorBlack,
                    suffixOnPressed: () {

                    },
                    boarderColor: ColorManager.colorPrimary,
                  ),
                ),
                TextFormFieldCustom(
                  controller: confirmPassword,
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm password can't be empty";
                    } else if (value != newPassword.text) {
                      return 'Password not match';
                    }
                    return null;
                  },
                  label: TextManager.confirmPassword.tr,
                  suffix: true,
                  inputTextColor: ColorManager.colorBlack,
                  suffixOnPressed: () {

                  },
                  boarderColor: ColorManager.colorPrimary,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: ElevatedButtonCustom(
                    height: 60.h,
                    colors: ColorManager.colorPrimary,
                    onPressed: ()  {

                    },
                    widget: Text(
                      TextManager.changePassword.tr,
                        style: TextStyleManager.textStyle16w500,
                    ),
                  ),
                )

              ],
              onExpansionChanged: (isExpanded) {
                print('Expanded $isExpanded');
              },
            ),
          ),
        ),
      ),
    );
  }
}

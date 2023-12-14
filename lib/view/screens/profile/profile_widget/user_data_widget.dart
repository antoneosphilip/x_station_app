import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:x_station_app/view/core_widget/custom_circle_loading/custom_circle_loading.dart';
import 'package:x_station_app/view_model/block/profile_cubit/profile_cubit.dart';
import 'package:x_station_app/view_model/block/profile_cubit/profile_states.dart';

import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/route_manager/page_name.dart';
import '../../../../core/style_font_manager/style_manager.dart';
import '../../../../core/text_manager/text_manager.dart';
import '../../../core_widget/custom_top_snack/custom_top_snack.dart';
import '../../../core_widget/snack_bar_custom/snack_bar_custom.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          InkWell(
            onTap: () {
              Get.defaultDialog(
                  title: '',
                  backgroundColor: ColorManager.colorWhite,
                  content: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      width: 800.w,
                      height: 400.h,
                      decoration: BoxDecoration(
                        color: ColorManager.colorPrimary,
                        // image: DecorationImage(
                        //     fit: BoxFit.cover,
                        //     image: NetworkImage(
                        //
                        //     )),
                        borderRadius: BorderRadius.circular(60.r),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 2,
                              color: ColorManager.colorSecondary,
                              offset: Offset(0, 0),
                              spreadRadius: 1)
                        ],
                      ),
                    ),
                  ));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 8.h),
              child: const Stack(
                clipBehavior: Clip.none,
                children: [
                  // AppBarWidget(
                  //   text: TextManager.USER_PROFILE.tr,
                  //   height: 200,
                  //   isBack: false,
                  //   // rightPadding: 80,
                  // ),
                  // Positioned(
                  //   left: 120.w,
                  //   top: 135.h,
                  //   child: CircleAvatar(
                  //     radius: 70.sp,
                  //
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Text(
              "${ProfileCubit.get(context).profileModel?.data?.name}",
              style: TextStyleManager.textStyle20w700,
            ),
          ),
          Text(
            "${ProfileCubit.get(context).profileModel?.data?.email}",
            style: TextStyleManager.textStyle14w500,

          ),
        ]);
  }
}

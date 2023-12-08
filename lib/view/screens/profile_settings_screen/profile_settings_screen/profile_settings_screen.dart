import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../../core/assets_manager/assets_manager.dart';
import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/text_manager/text_manager.dart';
import '../../../core_widget/custom_bottom_sheet_button/custom_bottom_sheet_button.dart';
import '../../../core_widget/tab_bar_widget/tab_bar_widget.dart';

import '../profile_settings_widget/account_data_card.dart';

class ProfileSettingsScreen extends StatelessWidget {
  ProfileSettingsScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const EditPhotoCard(),
            SizedBox(
              height: 270.h,
              child: Stack(
                //fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  AppBarWidget(
                    text: TextManager.profileSetting.tr,
                    height: 200,
                    rightPadding: 80,
                  ),
                  Positioned(
                      left: 120.w,
                      top: 135.h,
                      child: 
                      Stack(
                        //fit: StackFit.expand,
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                              radius: 70.sp,
                              backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.SzixlF6Io24jCN67HHZulAHaLH?rs=1&pid=ImgDetMain')
                          ),
                          Positioned(
                            bottom: 10.h,
                            right: 2.w,
                            child: InkWell(
                              onTap: ()  {

                              },
                              child: Container(
                                width: 50.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(16.r),
                                    color:
                                    ColorManager.colorWhite),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    AssetsImage.addPhoto,
                                    width: 40.w,
                                    height: 30.h,
                                    color: ColorManager.colorBlack,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Form( child: const AccountDataCard())
          ],
        ),
      ),
      bottomSheet: CustomBottomSheetButton(
        text: "Save Change",
        onPressed: () async {

        },
      ),
    );
  }

}

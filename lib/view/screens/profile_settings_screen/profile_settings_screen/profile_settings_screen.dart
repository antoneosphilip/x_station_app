import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:x_station_app/view/core_widget/custom_circle_loading/custom_circle_loading.dart';
import 'package:x_station_app/view/core_widget/flutter_toast/flutter_toast.dart';
import 'package:x_station_app/view_model/block/profile_cubit/profile_cubit.dart';
import 'package:x_station_app/view_model/block/profile_cubit/profile_states.dart';

import '../../../../core/assets_manager/assets_manager.dart';
import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/text_manager/text_manager.dart';
import '../../../../view_model/block/posts_cubit/posts_cubit.dart';
import '../../../core_widget/custom_bottom_sheet_button/custom_bottom_sheet_button.dart';
import '../../../core_widget/snack_bar_custom/snack_bar_custom.dart';
import '../../../core_widget/tab_bar_widget/tab_bar_widget.dart';

import '../profile_settings_widget/account_data_card.dart';

class ProfileSettingsScreen extends StatelessWidget {
  ProfileSettingsScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit,ProfileStates>(
      listener: (context,state){
        if(state is UpdateProfileSuccessState) {
          showFlutterToast(message: state.updateProfileModel.message, state: ToastState.SUCCESS);
        }
        else if(state is UpdateProfileErrorState){
          showFlutterToast(message: state.err, state: ToastState.ERROR);

        }
      },
      builder: (context,state){
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                      ),
                      Positioned(
                          left: 120.w,
                          top: 135.h,
                          child:
                          Stack(
                            //fit: StackFit.expand,
                            clipBehavior: Clip.none,
                            children: [
                              ProfileCubit.get(context).fileImage!=null?
                              CircleAvatar(
                                radius: 70.sp,
                                backgroundImage:FileImage(ProfileCubit.get(context).fileImage!),
                              ):
                              CircleAvatar(
                                  radius: 70.sp,
                                  backgroundImage: NetworkImage(ProfileCubit.get(context).profileModel!.data!.avatar!)
                              ),
                              Positioned(
                                  left: 55.w,
                                  top: -15.h,

                                  child: InkWell(
                                      onTap: (){
                                        ProfileCubit.get(context).cancelImg();
                                      },
                                      child:  ProfileCubit.get(context).fileImage!=null?
                                      const Icon(Icons.close,color: ColorManager.colorBlack,size: 40,)
                                  :const SizedBox(),
                                  )),

                              Positioned(
                                bottom: -20.h,
                                right: 50.w,
                                child: InkWell(
                                  onTap: ()  {
                                    ProfileCubit.get(context).selectPhoto();

                                  },
                                  child: Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(16.r),
                                        color:
                                        ColorManager.colorWhite),
                                    child: InkWell(
                                      onTap: (){
                                        ProfileCubit.get(context).selectPhoto();

                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                          AssetsImage.addPhoto,
                                          width: 40.w,
                                          height: 30.h,
                                          color: ColorManager.colorBlack,
                                          fit: BoxFit.cover,
                                        ),
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
                const Form( child: AccountDataCard())
              ],
            ),
          ),
          bottomSheet: state is UpdateProfileLoadingState||state is ProfileLoadingState?const CustomCircleLoading():CustomBottomSheetButton(
            text: "Save Change".tr,
            onPressed: () async {
              ProfileCubit.get(context).updateProfileData();
            },
          ),
        );
      },
    );
  }

}

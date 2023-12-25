import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/view/core_widget/flutter_toast/flutter_toast.dart';
import 'package:x_station_app/view_model/block/posts_cubit/posts_cubit.dart';
import 'package:x_station_app/view_model/block/posts_cubit/posts_states.dart';
import 'package:x_station_app/view_model/block/profile_cubit/profile_cubit.dart';
import 'package:x_station_app/view_model/block/profile_cubit/profile_states.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../core/text_manager/text_manager.dart';
import '../../../../core_widget/elevated_button/elevated_button_custom.dart';
import '../../../rate_screen/rate_screen/retae_screen.dart';

void AlterDialog(BuildContext context,userId,postId,myPost,statue){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      backgroundColor: ProfileCubit.get(context).isDark?ColorManager.colorLightDark:ColorManager.colorWhite,
      actions: [
        BlocConsumer<PostsCubit,PostsStates>(
          listener: (context,state) async {
            if(state is AcceptPostLoadingState){
              await EasyLoading.show(
                status: 'loading...',
                maskType: EasyLoadingMaskType.black,
              );
            }
           else if(state is AcceptPostSuccessState){
              await EasyLoading.dismiss();
              showFlutterToast(message: state.acceptPostModel.message, state: ToastState.SUCCESS);
              Get.back();
              PostsCubit.get(context).showPost(id: postId);

            }
            else if(state is AcceptPostErrorState){
              await EasyLoading.dismiss();
              showFlutterToast(message: state.err, state: ToastState.ERROR);
            }
          },
          builder: (context,state){
            return Container(
              width: 300.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: ProfileCubit.get(context).isDark?ColorManager.colorLightDark:ColorManager.colorWhite,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 24.h,),
                  Row(
                    children: [
                      SizedBox(width: 100.w,),
                      Row(
                        children: [
                          Text(TextManager.options,style: TextStyleManager.textStyle20w700.copyWith(fontSize: 22.sp,color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary,),),
                          SizedBox(width: 5.w,),
                          Image.asset(AssetsImage.settingsImage,width: 20,height: 20,color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorBlack ,),

                        ],
                      ),
                      SvgPicture.asset(AssetsImage.settings),
                    ],
                  ),
                  SizedBox(height: 41.h,),
                  ElevatedButtonCustom(
                    width: 170.w,
                    height: 65.h,
                    radius: 60,
                    colors: ColorManager.colorGreen,
                    onPressed: (){
                      PostsCubit.get(context).acceptPost(userId: userId, postId: postId, status: 'accepted');
                    },
                    widget: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(TextManager.accept,style: TextStyleManager.textStyle20w700.copyWith(color: Colors.white),),
                          SizedBox(width: 3.w,),
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Icon(CupertinoIcons.checkmark_alt,color: ColorManager.colorGreen,),
                          ),

                        ],
                      ),
                    ),
                  ),
                  myPost && statue=='accepted'?
                  Padding(
                    padding:  EdgeInsets.only(top: 22.h),
                    child: ElevatedButtonCustom(
                      width: 170.w,
                      height: 65.h,
                      radius: 60,
                      colors: ColorManager.colorGreen,
                      onPressed: (){
                        Get.to(RateScreen( userID: userId,));
                      },
                      widget: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(TextManager.jobDone,style: TextStyleManager.textStyle20w700.copyWith(color: Colors.white),),
                            SizedBox(width: 3.w,),
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(CupertinoIcons.checkmark_alt,color: ColorManager.colorGreen,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ):const SizedBox(),
                  SizedBox(height: 22.h,),
                  ElevatedButtonCustom(
                    width: 170.w,
                    height: 65.h,
                    radius: 60,
                    colors: ColorManager.colorWhite,
                    borderColor: ColorManager.colorRed,
                    onPressed: (){
                      PostsCubit.get(context).acceptPost(userId: userId, postId: postId, status: 'rejected');
                    },
                    widget: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(TextManager.cancel,style: TextStyleManager.textStyle20w700.copyWith(color: ColorManager.colorRed),),
                          SizedBox(width: 9.w,),
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorManager.colorRed,
                            ),
                            child: const Icon(CupertinoIcons.delete,color: ColorManager.colorWhite,),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 31.h,),
                  ElevatedButtonCustom(
                    width: 108.w,
                    height: 51.h,
                    radius: 60,
                    colors: ColorManager.colorWhite,
                    borderColor: ColorManager.colorPrimary,
                    onPressed: (){
                      Get.back();
                    },
                    widget: Center(
                      child: Text(TextManager.cancel,style: TextStyleManager.textStyle20w700.copyWith(color: ColorManager.colorPrimary),),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  });
}
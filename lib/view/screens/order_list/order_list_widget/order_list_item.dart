import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/screens/Applying/Applying_screen/Applying_screen.dart';
import 'package:x_station_app/view_model/block/posts_cubit/posts_cubit.dart';

import '../../../../core/assets_manager/assets_manager.dart';
import '../../../../view_model/block/profile_cubit/profile_cubit.dart';
import '../../../core_widget/elevated_button/elevated_button_custom.dart';
import '../../electrician_information/electrician_information_screen/electrician_information_Screen.dart';
import '../../rate_screen/rate_screen/retae_screen.dart';

class OrderListItem extends StatelessWidget {
  final String title;
  final String description;
  final String? image;
  final String namePerson;
  final int id;
  final int isApplied;
  final int isJob;

  OrderListItem({

    required this.title, required this.description, required this.image, required this.namePerson, required this.id, required this.isApplied, required this.isJob});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to( ApplyScreen(description: description,title: title,id: id,isApplied:isApplied,isJob:isJob),
          duration: const Duration(
            milliseconds: 250,
          ),
          transition:Transition.zoom
          ,);
      },
      child: Container(

        width: 390.w,
        decoration: BoxDecoration(
          boxShadow:  [
            BoxShadow(
              color:  ProfileCubit.get(context).isDark?
              ColorManager.colorLightDark:
              Colors.grey,
              offset: const Offset(2.0, 2.0),
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.circular(16.r),
          color: ProfileCubit.get(context).isDark?
          ColorManager.colorLightDark:
          ColorManager.colorWhite,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  PostsCubit.get(context).showPost(id: id);
                  Get.to(ElectricianInformationScreen(
                    name: PostsCubit.get(context).showPostModel!.data!.user!.name!,
                    rate: PostsCubit.get(context).showPostModel!.data!.user!.averageRating!,
                    price: '15',
                    email: PostsCubit.get(context).showPostModel!.data!.user!.email!,
                    phone: PostsCubit.get(context).showPostModel!.data!.user!.phoneNumber!,
                    address: PostsCubit.get(context).showPostModel!.data!.user!.address!,
                    isTech: false,
                    image: PostsCubit.get(context).showPostModel!.data!.user!.avatar!,
                  ));
                },
                child: Row(
                  children: [
                    SizedBox(width: 16.w,),
                     CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(image!)
                    ),
                    SizedBox(width: 7.w,),
                    Text(namePerson,style: TextStyleManager.textStyle14w500.copyWith(color:
                    ProfileCubit.get(context).isDark?
                    ColorManager.colorWhiteDarkMode:
                    ColorManager.colorSecondary,),),
                    const Spacer(),
                    InkWell(
                        onTap: (){
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              backgroundColor: ProfileCubit.get(context).isDark?ColorManager.colorLightDark:ColorManager.colorWhite,
                              actions: [
                              Container(
                              width: 300.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.r),
                                color: ProfileCubit.get(context).isDark?ColorManager.colorLightDark:ColorManager.colorWhite,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 30.h,),
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
                                  Padding(
                                    padding:  EdgeInsets.only(top: 22.h),
                                    child: ElevatedButtonCustom(
                                      width: 170.w,
                                      height: 65.h,
                                      radius: 60,
                                      colors: ColorManager.colorGreen,
                                      onPressed: (){
                                        Get.to(RateScreen( userID:
                                        PostsCubit.get(context).showPostModel!.data!.user!.id!,
                                          ));
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
                                  ),
                                  SizedBox(height: 30.h,)
                                ],
                              ),
                            ),
                              ],
                            );
                          }
                          );
                        },
                        child: Image.asset(AssetsImage.settingsImage,width: 20,height: 20,color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorBlack ,)),
                    SizedBox(width: 30.w,),
                  ],
                ),
              ),
              SizedBox(height: 16.h,),
              Padding(
                padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                child: Text(title,style:TextStyleManager.textStyle16w500.copyWith(color:
                ProfileCubit.get(context).isDark?
                ColorManager.colorWhiteDarkMode:
                ColorManager.colorSecondary
                ) ,),
              ),
              SizedBox(height: 8.h,),
              image!=''?
              CachedNetworkImage(imageUrl: image!,fit: BoxFit.fill,width: 390.w,height: 390.h,):
              const SizedBox(),
              SizedBox(height: 8.h,),
              Padding(
                padding:  EdgeInsets.all(16.0.sp),
                child: Center(child: Text(description,style: TextStyleManager.textStyle16w500.copyWith(
                  color:  ProfileCubit.get(context).isDark?
                  ColorManager.colorWhiteDarkMode:
                  ColorManager.colorSecondary
                ),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

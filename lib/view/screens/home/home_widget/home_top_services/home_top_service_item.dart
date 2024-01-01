import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';

import '../../../../../view_model/block/profile_cubit/profile_cubit.dart';
import '../home_post_item_Details/home_post_details_Screen/home_post_Details_Screen.dart';

class HomeTopServiceItem extends StatelessWidget {
  final String title;
  final String description;
  final String? image;
  final String namePerson;
  final int id;
  final String imagePerson;

  HomeTopServiceItem({

   required this.title, required this.description, required this.image, required this.namePerson, required this.id, required this.imagePerson});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Get.to( HomePostDetailsScreen(id: id,imagePerson:imagePerson));
      },
      child: Container(
        width: 390.w,
        decoration: BoxDecoration(
          boxShadow:  [
            BoxShadow(
              color:ProfileCubit.get(context).isDark?ColorManager.colorLightDark:ColorManager.colorGrey,
              offset: const Offset(2.0, 2.0),
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.circular(16.r),
          color: ProfileCubit.get(context).isDark?ColorManager. colorLightDark:ColorManager.colorWhite,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 16.w,),
                   CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(imagePerson!)
                  ),
                  SizedBox(width: 7.w,),
                  Text(namePerson,style: TextStyleManager.textStyle14w500.copyWith(color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary,)),
                ],
              ),
              SizedBox(height: 16.h,),
             Padding(
               padding:  EdgeInsets.only(left: 16.w,right: 16.w),
               child: Text(title,style:TextStyleManager.textStyle16w500.copyWith(color:ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary,) ,),
             ),
             SizedBox(height: 8.h,),
             image !=''?
             CachedNetworkImage(imageUrl: image!,fit: BoxFit.fill,width: 390.w,height: 390.h,):
                 const SizedBox(),
              SizedBox(height: 8.h,),
              Center(child: Text(description,style: TextStyleManager.textStyle16w500.copyWith(color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary,),)),
              SizedBox(height: 8.h,),
            ],
          ),
        ),
      ),
    );
  }
}

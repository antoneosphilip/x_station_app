import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/screens/Applying/Applying_screen/Applying_screen.dart';
import 'package:x_station_app/view/screens/electrician_information/electrician_information_screen/electrician_information_Screen.dart';
import 'package:x_station_app/view_model/block/posts_cubit/posts_cubit.dart';
import 'package:x_station_app/view_model/block/posts_cubit/posts_states.dart';

import '../../../../../view_model/block/profile_cubit/profile_cubit.dart';

class HomePostsTechnician extends StatefulWidget {
  final String title;
  final String description;
  final String? image;
  final String namePerson;
  final int id;
  final int isApplied;
  final int isJob;
  final String? imagePerson;

  HomePostsTechnician({

    required this.title, required this.description, required this.image, required this.namePerson, required this.id, required this.isApplied, required this.isJob, this.imagePerson});

  @override
  State<HomePostsTechnician> createState() => _HomePostsTechnicianState();
}

class _HomePostsTechnicianState extends State<HomePostsTechnician> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PostsCubit.get(context).showPost(id: widget.id);

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to( ApplyScreen(description: widget.description,title: widget.title,id: widget.id,isApplied:widget.isApplied,isJob:widget.isJob),
          duration: const Duration(
          milliseconds: 250,
        ),
            );
      },
      child: Container(

        width: 390.w,
        decoration: BoxDecoration(
          boxShadow:  [
            BoxShadow(
              color:ProfileCubit.get(context).isDark?ColorManager.colorLightDark: Colors.grey,
              offset: const Offset(2.0, 2.0),
              blurRadius: 5.0,
            ),
          ],
            borderRadius: BorderRadius.circular(16.r),
            color: ProfileCubit.get(context).isDark?ColorManager.colorLightDark:ColorManager.colorWhite,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 16.w,),
                   InkWell(
                     onTap: (){
                       Get.to(ElectricianInformationScreen(
                         name: PostsCubit.get(context).showPostModel!.data!.user!.name!,
                         image:PostsCubit.get(context).showPostModel!.data!.user!.avatar!,
                         rate: PostsCubit.get(context).showPostModel!.data!.user!.averageRating!,
                         price: '15',
                         email: PostsCubit.get(context).showPostModel!.data!.user!.email!,
                         phone: PostsCubit.get(context).showPostModel!.data!.user!.phoneNumber!,
                         address: PostsCubit.get(context).showPostModel!.data!.user!.address!,
                         isTech: false,
                       ));
                     },
                     child: Row(
                       children: [
                         CircleAvatar(
                             radius: 30,
                             backgroundImage: NetworkImage(widget.imagePerson!)
                         ),
                  SizedBox(width: 7.w,),
                  Text("${widget.namePerson}",style: TextStyleManager.textStyle14w500.copyWith(color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorBlack),),
                       ],
                     ),
                   ),
                  const Spacer(),
                  widget.isJob==0?
                  Row(
                    children: [
                      Text(TextManager.available,style: TextStyleManager.textStyle14w500.copyWith(color: ColorManager.colorGreen),),
                      SizedBox(width: 5.w,),
                      const Icon(Icons.check,color: ColorManager.colorGreen,),
                    ],
                  ):
                   Row(
                    children: [
                      Text(TextManager.reversedBySomeOne,style: TextStyleManager.textStyle14w500.copyWith(color: ColorManager.colorRed),),
                    ],
                  ),
                  SizedBox(width: 15.w,)
                ],
              ),
              SizedBox(height: 16.h,),
              Padding(
                padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                child: Text(widget.title,style:TextStyleManager.textStyle16w500.copyWith(color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorBlack) ,),
              ),
              SizedBox(height: 8.h,),
              widget.image!=''?
              CachedNetworkImage(imageUrl: widget.image!,fit: BoxFit.fill,width: 390.w,height: 390.h,):
                  const SizedBox(),
              SizedBox(height: 8.h,),
              Padding(
                padding:  EdgeInsets.all(16.0.sp),
                child: Center(child: Text(widget.description,style: TextStyleManager.textStyle16w500.copyWith(color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorBlack),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

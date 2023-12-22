import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/screens/Applying/Applying_screen/Applying_screen.dart';

class HomePostsTechnician extends StatelessWidget {
  final String title;
  final String description;
  final String? image;
  final String namePerson;
  final int id;
  final int isApplied;
  final int isJob;

  HomePostsTechnician({

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
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(2.0, 2.0),
              blurRadius: 5.0,
            ),
          ],
            borderRadius: BorderRadius.circular(16.r),
            color: ColorManager.colorWhite,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 16.w,),
                  const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.Z5BlhFYs_ga1fZnBWkcKjQHaHz?rs=1&pid=ImgDetMain")
                  ),
                  SizedBox(width: 7.w,),
                  Text("${namePerson}",style: TextStyleManager.textStyle14w500,),
                  const Spacer(),
                  isJob==0?
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
                child: Text(title,style:TextStyleManager.textStyle16w500 ,),
              ),
              SizedBox(height: 8.h,),
              image!=''?
              CachedNetworkImage(imageUrl: image!,fit: BoxFit.fill,width: 390.w,height: 390.h,):
                  const SizedBox(),
              SizedBox(height: 8.h,),
              Padding(
                padding:  EdgeInsets.all(16.0.sp),
                child: Center(child: Text(description,style: TextStyleManager.textStyle16w500,)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

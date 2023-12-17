import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';

class HomeTopServiceItem extends StatelessWidget {
  final String title;
  final String description;
  final String? image;
  final String namePerson;

  HomeTopServiceItem({

   required this.title, required this.description, required this.image, required this.namePerson});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorManager.colorWhite,
        border: Border.all(
          color: CupertinoColors.black
        )
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
              ],
            ),
            SizedBox(height: 16.h,),
           CachedNetworkImage(imageUrl: image!,fit: BoxFit.fill,width: 390.w,height: 390.h,),
            SizedBox(height: 8.h,),
            Padding(
              padding:  EdgeInsets.all(16.0.sp),
              child: Text(description,style: TextStyleManager.textStyle16w500,),
            ),


          ],
        ),
      ),
    );
  }
}

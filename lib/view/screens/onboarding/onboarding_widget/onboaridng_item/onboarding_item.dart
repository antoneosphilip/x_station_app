import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../build_iot/build_iot.dart';

class OnBoardingItem extends StatelessWidget {
  final String image;
  final String text1;
  final String text2;
  final PageController pageController;
  final int isIndex;

  const OnBoardingItem({super.key, required this.image, required this.text1, required this.text2, required this.pageController, required this.isIndex});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 156.h,),
        Center(child: Image.asset(image,width: 300.w,height: 300.h,fit: BoxFit.cover,)),
        SizedBox(height: 64.h,),
        Padding(
          padding:  EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text1,style: TextStyleManager.textStyle36w700,),
              SizedBox(height: 5.h,),
              Text(text2,style: TextStyleManager.textStyle24w300,),
              SizedBox(height: 58.h,),
              Row(
                children: [
                  SizedBox(
                    height: 10.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context,index)=>
                         BuildIotItem(isIndex: index==isIndex,),
                        separatorBuilder: (context,index)=>SizedBox(width: 2.w,),
                        itemCount: 3),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: (){
                      pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOutExpo);
                      if(isIndex+1==3){
                        Get.toNamed(PageName.login);
                      }
                    },
                    backgroundColor: ColorManager.colorPrimary,
                    child:SvgPicture.asset(AssetsImage.arrowRight),

                  ),
                  SizedBox(width: 28.h,),
                ],
              ),
            ],
          ),
        ),

      ],
    );
  }
}

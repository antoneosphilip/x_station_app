import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/screens/home/home_widget/home_Search/home_Search_Screen/home_Search_Screen.dart';
import 'package:x_station_app/view/screens/home/home_widget/homebar_shimmer/home_app_bar_shimmer.dart';
import 'package:x_station_app/view_model/block/category_cubit/category_cubit.dart';
import 'package:x_station_app/view_model/block/category_cubit/category_states.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/route_manager/page_name.dart';
import '../../../../../utility/database/local/cach_data.dart';
import '../../../../core_widget/text_form_field/text_form_field_custom.dart';

class HomeAppBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(left: 16.w,right: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Hi, ".tr,style: TextStyleManager.textStyle24w500.copyWith(fontWeight: FontWeight.w700),),
                        Text('${CachingDataManager.instance.getLoginModel().data!.name}',style: TextStyleManager.textStyle24w500.copyWith(fontWeight: FontWeight.w700),)
                      ],
                    ),

                    Text(TextManager.needSomeHelp.tr,style: TextStyleManager.textStyle14w500,),
                    SizedBox(height: 28.h,),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: (){
                  Get.toNamed(PageName.postScreen);
                },
                child: Container(
                  width: 30,
                  height: 25.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.colorBlack,
                  ),
                  child: const Center(child: Icon(Icons.add,color: Colors.white,)),
                ),
              ),
              SizedBox(width: 14.w,),
              SvgPicture.asset(AssetsImage.notification,fit: BoxFit.cover,color: ColorManager.colorBlack,height: 25.h,),
              SizedBox(width: 14.w,),
              const CircleAvatar(
                radius: 28,
                backgroundImage: CachedNetworkImageProvider('https://th.bing.com/th/id/OIP.Ghae4OEdb4UmC3hkqpFvLAHaGd?rs=1&pid=ImgDetMain'),
              ),
              SizedBox(width: 16.w,)
            ],
          ),
          InkWell(
            onTap: (){
              Get.to(const HomeSearchScreen());
            },
            child: Padding(
              padding:  EdgeInsets.only(left: 5.w,right: 5.w),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormFieldCustom(
                      fillColor: Colors.white,
                      boarderColor: ColorManager.colorPrimary,
                      hint: TextManager.findItHere.tr,
                      validate: (value){},
                      suffix: true,
                      suffixIcon: InkWell(
                          onTap: (){
                            Get.to(const HomeSearchScreen());

                          },
                          child: SvgPicture.asset(AssetsImage.search)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

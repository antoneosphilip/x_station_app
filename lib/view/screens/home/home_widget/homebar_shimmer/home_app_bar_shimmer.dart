import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_shimmer/color_shimmer.dart';
import '../../../../../core/route_manager/page_name.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../core/text_manager/text_manager.dart';
import '../../../../../utility/database/local/cach_data.dart';
import '../../../../core_widget/text_form_field/text_form_field_custom.dart';
import '../../../home/home_widget/home_top_services/home_top_service_item.dart';

class HomeAppBarShimmer extends StatelessWidget {
  const HomeAppBarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Shimmer.fromColors(
          baseColor:ColorShimmer.baseColor,
          highlightColor: ColorShimmer.highlightColor,
          child: Padding(
            padding:  EdgeInsets.only(left: 16.w),
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
                          Text("Hi,",style: TextStyleManager.textStyle24w500.copyWith(fontWeight: FontWeight.w700),),
                          Text(TextManager.needSomeHelp,style: TextStyleManager.textStyle14w500,),
                          SizedBox(height: 28.h,),
                        ],
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: (){

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
                Padding(
                  padding:  EdgeInsets.only(left: 5.w,right: 17.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormFieldCustom(
                          fillColor: Colors.white,
                          boarderColor: ColorManager.colorPrimary,
                          hint: TextManager.findItHere,
                          validate: (value){},
                          suffix: true,
                          suffixIcon: SvgPicture.asset(AssetsImage.search),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

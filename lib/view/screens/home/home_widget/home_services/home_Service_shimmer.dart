import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_shimmer/color_shimmer.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../core/text_manager/text_manager.dart';
import '../../../category/category_electrician/category_electrician.dart';
import '../../../home_technical/home_technical_widget/home_services/home_services_item.dart';




class HomeServiceShimmer extends StatelessWidget {
  const HomeServiceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Shimmer.fromColors(
          baseColor:ColorShimmer.baseColor,
          highlightColor: ColorShimmer.highlightColor,
          child:    Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TextManager.services,style: TextStyleManager.textStyle36w700,),
              SizedBox(height: 16.h,),
              SizedBox(
                height: 113.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return  Container(
                        width: 256.w,
                        height: 113.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.r),
                        ),
                        child: Image.asset(AssetsImage.testHome,fit: BoxFit.cover,),
                      );
                    },
                    separatorBuilder: (context,index){
                      return SizedBox(width: 16.w,);
                    },
                    itemCount: 10
                ),
              ),
            ],
          )
        )
    );
  }
}

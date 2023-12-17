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
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../core/text_manager/text_manager.dart';
import '../../../home/home_widget/home_top_services/home_top_service_item.dart';

class PostingShimmer extends StatelessWidget {
  const PostingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Shimmer.fromColors(
          baseColor:ColorShimmer.baseColor,
          highlightColor: ColorShimmer.highlightColor,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TextManager.post,style: TextStyleManager.textStyle36w700,),
              SvgPicture.asset(AssetsImage.line,width: 114.w,),
              SizedBox(height: 16.h,),
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return   Padding(
                      padding:  EdgeInsets.only(right: 21.w),
                      child: Container(
                        width: 323.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r),
                          color: ColorManager.colorXPrimary
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(left: 19.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 7.h,),
                                    Text("", style: TextStyleManager.textStyle24w300.copyWith(fontWeight: FontWeight.bold),),
                                    SizedBox(height: 8.h,),
                                    Text("",
                                      style: TextStyleManager.textStyle20600.copyWith(fontWeight: FontWeight.w400),),
                                    SizedBox(height: 12.h,),
                                    // Row(
                                    //   children: [
                                    //     Text("Technician",style: TextStyleManager.textStyle10w400.copyWith(fontSize: 8.sp) ,),
                                    //     SizedBox(width: 14.w,),
                                    //     Text("plubmer",style: TextStyleManager.textStyle10w400.copyWith(fontSize: 8.sp) ,),
                                    //
                                    //   ],
                                    // ),
                                    SizedBox(height: 6.h,),
                                  ],
                                ),
                              ),
                              SizedBox(width: 11.w,),
                              // Text("15.00 \$ hr",style: TextStyleManager.textStyle10w400.copyWith(fontWeight: FontWeight.w800),),
                              SizedBox(width: 7.w,)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context,index){
                    return SizedBox(height: 16.h);
                  },
                  itemCount: 10
              ),
            ],
          ),
        )
    );
  }
}

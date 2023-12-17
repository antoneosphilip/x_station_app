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
              Padding(
                padding:  EdgeInsets.only(left: 16.w),
                child: Text(TextManager.post,style: TextStyleManager.textStyle36w700,),
              ),
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        color: ColorManager.colorPrimary
                      ),
                      child: Text(''),
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

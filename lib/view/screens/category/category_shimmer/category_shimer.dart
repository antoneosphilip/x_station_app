import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/assets_manager/assets_manager.dart';
import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/color_shimmer/color_shimmer.dart';
import '../../../../core/style_font_manager/style_manager.dart';
import '../../../../core/text_manager/text_manager.dart';
import '../../../core_widget/tab_bar_widget/tab_bar_widget.dart';
import '../category_electrician/category_electrician.dart';
class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Shimmer.fromColors(
            baseColor:ColorShimmer.baseColor,
            highlightColor: ColorShimmer.highlightColor,
            child:  GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 190.h,
                    childAspectRatio: .9.h,
                    crossAxisSpacing: .1.w,
                    mainAxisSpacing: 10.h
                ),
                itemCount: 10,
                itemBuilder: (BuildContext ctx, index) {
                  return Column(
                    children: [
                      Container(
                        width: 153.w,
                        color: ColorManager.colorSecondary,
                        child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
                            child: SvgPicture.asset(AssetsImage.category)
                        ),
                      ),
                      Text(
                        "electrican",
                        style: TextStyleManager.textStyle24w300.copyWith(fontWeight: FontWeight.w400),
                      )
                    ],
                  );
                }
            ),
        )
    );
  }
}

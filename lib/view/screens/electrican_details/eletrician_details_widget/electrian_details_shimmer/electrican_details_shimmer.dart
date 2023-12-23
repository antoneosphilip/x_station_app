import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/color_shimmer/color_shimmer.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../view_model/block/profile_cubit/profile_cubit.dart';
import '../../../everent/custom_ratting_bar/custom_rating_bar.dart';
import '../electrician_details_item/electrician_details_item.dart';

class ElectricalDetailsShimmer extends StatelessWidget {
  const ElectricalDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Shimmer.fromColors(
            baseColor:ColorShimmer.baseColor,
            highlightColor: ProfileCubit.get(context).isDark?ColorManager.colorDark:ColorShimmer.highlightColor,
            child:  ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return   const ElectricianDetailsItem(
                  // image:TechnicalCubit.get(context).technicalModel!.data![index].user!.avatar! ,
                  name: '' ,
                  rate: 1,
                  price: '',
                  image: '', email: '', phone: '', address: '',
                );
              },
              separatorBuilder: (context,index){
                return SizedBox(height: 14.h);
              },
              itemCount: 10,
            )
        )
    );
  }
}

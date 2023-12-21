import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';

import 'package:x_station_app/view/screens/category/category_electrician/category_electrician.dart';

import '../../../../core/color_manager/color_manager.dart';
import '../../../../view_model/block/profile_cubit/profile_cubit.dart';

class CategoryTopText extends StatelessWidget {
final String text;

  const CategoryTopText({super.key,  this.text=TextManager.category});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 48.h, left: 14.w,right: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${text}",
            style: TextStyleManager.textStyle24w300.copyWith(fontWeight: FontWeight.w700,color: ProfileCubit.get(context).isDark?ColorManager.colorWhite:ColorManager.colorBlack,),
          ),
          const SizedBox(height: 10),
          SvgPicture.asset(AssetsImage.line,width: 105.w,color: ProfileCubit.get(context).isDark?ColorManager.colorWhite:ColorManager.colorPrimary,),
        ],
      ),
    );

    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [

    //   ],
    // );
  }
}

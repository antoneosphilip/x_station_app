import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/model/category_model/category_model.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../view_model/block/profile_cubit/profile_cubit.dart';

class HomeServicesItem extends StatelessWidget {
  final String image;
  final String name;

  const HomeServicesItem({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child:Column(
        children: [
          Padding(
            padding:  const EdgeInsets.all(12),
            child: Image(image: CachedNetworkImageProvider(image),fit: BoxFit.cover),
          ),
          SizedBox(height: 5.h,),
          Text(name,style: TextStyleManager.textStyle14w500.copyWith(color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorBlack,),)
        ],
      )

    );
  }
}

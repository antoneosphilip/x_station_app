import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/model/category_model/category_model.dart';

import '../../../../../core/assets_manager/assets_manager.dart';

class HomeServicesItem extends StatelessWidget {
  final String image;
  const HomeServicesItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256.w,
      height: 113.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.r),
        image: DecorationImage(image: CachedNetworkImageProvider(image),fit: BoxFit.fill)
      ),
      
    );
  }
}

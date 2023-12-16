import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/view/screens/electrican_details/electrican_details_screen/electrican_details_screen.dart';

class CustomCategoryItem extends StatelessWidget {
  final String image;
  final String name;
  final int id;
  const CustomCategoryItem({super.key, required this.image, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Get.to( ElectricianDetailsScreen(id: id,),duration: const Duration(
          milliseconds: 250,
        ),
          transition: Transition.downToUp,
        );
      },
      child: Column(
        children: [
          Container(
            width: 153.w,
            color: ColorManager.colorWhite,
            child: CachedNetworkImage(imageUrl:image,fit: BoxFit.cover,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: ColorManager.colorPrimary,)),
              errorWidget: (context, url, error) => const Icon(Icons.error),),
          ),
          Text(
            "$name",
            style: TextStyleManager.textStyle24w300.copyWith(fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

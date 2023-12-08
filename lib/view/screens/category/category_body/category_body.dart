import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/view/screens/category/category_electrician/category_electrician.dart';
import 'package:x_station_app/view/screens/category/category_top_text/category_top_text.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CategoryTopText(),
        SizedBox(height: 38.h,),
        Expanded(
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
              gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 190.h,
                  childAspectRatio: 2.1 / 2.r,
                  crossAxisSpacing: 1.w,
                  mainAxisSpacing: 10.h
              ),
              itemCount: 10,
              itemBuilder: (BuildContext ctx, index) {
                return const CustomCategoryItem();
              }
          ),
        ),
      ],
    );
  }
}